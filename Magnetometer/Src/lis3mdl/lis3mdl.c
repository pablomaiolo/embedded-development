/*
 * Copyright (c) 2019, Pablo Maiolo 
 * All rights reserved. 
 *
 * Redistribution and use in source and binary forms, with or without 
 * modification, are permitted provided that the following conditions are met: 
 *
 *  * Redistributions of source code must retain the above copyright notice, 
 *    this list of conditions and the following disclaimer. 
 *  * Redistributions in binary form must reproduce the above copyright 
 *    notice, this list of conditions and the following disclaimer in the 
 *    documentation and/or other materials provided with the distribution. 
 *  * Neither the name of  nor the names of its contributors may be used to 
 *    endorse or promote products derived from this software without specific 
 *    prior written permission. 

 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" 
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE 
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE 
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE 
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR 
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF 
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS 
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN 
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) 
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE 
 * POSSIBILITY OF SUCH DAMAGE. 
*/

#include "lis3mdl.h"

/* Sensitivity of each scale in LSB/G */
uint16_t sensitivity[4] = {
    6842,   /* 4G  */
    3421,   /* 8G  */
    2281,   /* 12G */
    1711    /* 16G */
};

static int write_reg_raw(struct lis3mdl_dev *dev, struct lis3mdl_reg *reg, uint8_t value)
{
    HAL_StatusTypeDef status;
    int ret;
    
    status = HAL_I2C_Mem_Write(dev->i2c, LIS3MDL_ADDRESS, reg->address, 1, &value, 1, HAL_MAX_DELAY);
    
    switch(status)
    {
        case HAL_OK:    ret = LIS3MDL_OK   ; break;
        case HAL_ERROR: ret = LIS3MDL_ERROR; break;
        case HAL_BUSY:  ret = LIS3MDL_BUSY ; break;
        default:        ret = LIS3MDL_ERROR; break;
    }
    
    return ret;
}

static int write_reg(struct lis3mdl_dev *dev, struct lis3mdl_reg *reg, uint8_t value, uint8_t mask, int pos)
{
    int tmp_reg = reg->value;
    int ret;

    tmp_reg &= ~mask;
    tmp_reg |= (value << pos) & mask;

    ret = write_reg_raw(dev, reg, tmp_reg);

    if(ret == LIS3MDL_OK)
        reg->value = tmp_reg;

    return ret;
}

static int16_t two_byte_to_signed(uint8_t low_byte, uint8_t high_byte)
{
    uint16_t tmp = ((uint16_t)high_byte << 8) | low_byte;
    int16_t result;
    
    /* Convert unsigned value to signed this way to avoid implementation-defined behaviour */
    if(tmp < 0x8000)
        result = tmp;
    else
        result = -(0x10000 - tmp);
    
    return result;
}

int lis3mdl_init(struct lis3mdl_dev *dev, I2C_HandleTypeDef *i2c)
{
    dev->i2c = i2c;
    
    dev->scale = 0;
    
    dev->ctrl_reg1.address = CTRL_REG1_ADDR;
    dev->ctrl_reg2.address = CTRL_REG2_ADDR;
    dev->ctrl_reg3.address = CTRL_REG3_ADDR;
    dev->ctrl_reg4.address = CTRL_REG4_ADDR;
    
    dev->ctrl_reg1.value = CTRL_REG1_RESET_VAL;
    dev->ctrl_reg2.value = CTRL_REG2_RESET_VAL;
    dev->ctrl_reg3.value = CTRL_REG3_RESET_VAL;
    dev->ctrl_reg4.value = CTRL_REG4_RESET_VAL;
    
    return lis3mdl_reset(dev);
}

int lis3mdl_reset(struct lis3mdl_dev *dev)
{
    int ret;
    
    ret = write_reg(dev, &(dev->ctrl_reg2), 1, SOFT_RST_mask, SOFT_RST_pos);
    
    if(ret != LIS3MDL_OK)
        return ret;
    
    dev->scale = 0;
    
    dev->ctrl_reg1.value = CTRL_REG1_RESET_VAL;
    dev->ctrl_reg2.value = CTRL_REG2_RESET_VAL;
    dev->ctrl_reg3.value = CTRL_REG3_RESET_VAL;
    dev->ctrl_reg4.value = CTRL_REG4_RESET_VAL;
    
    return LIS3MDL_OK;
}

int lis3mdl_set_axis_mode(struct lis3mdl_dev *dev, uint8_t x_y_axes_mode, uint8_t z_axes_mode)
{
    int ret;
    
    ret = write_reg(dev, &(dev->ctrl_reg1), x_y_axes_mode, XYAXIS_MODE_mask, XYAXIS_MODE_pos);
    
    if(ret != LIS3MDL_OK)
        return ret;
    
    ret = write_reg(dev, &(dev->ctrl_reg4), z_axes_mode, ZAXIS_MODE_mask, ZAXIS_MODE_pos);
    
    return ret;
}

int lis3mdl_set_output_data_rate(struct lis3mdl_dev *dev, uint8_t output_data_rate)
{
    int ret;
    uint8_t tmp_reg = dev->ctrl_reg1.value;
    
    tmp_reg &= ~(FAST_ODR_mask | OUTPUT_RATE_mask);
    
    if(output_data_rate == OUTPUT_RATE_FAST)
    {
        tmp_reg |= 1 << FAST_ODR_pos;
    }
    else
    {
        tmp_reg |= (output_data_rate << OUTPUT_RATE_pos) & OUTPUT_RATE_mask;
    }
    
    ret = write_reg_raw(dev, &(dev->ctrl_reg1), tmp_reg);
    
    if(ret == LIS3MDL_OK)
        dev->ctrl_reg1.value = tmp_reg;
    
    return ret;
}

int lis3mdl_enable_temp_sensor(struct lis3mdl_dev *dev, uint8_t enable)
{
    int ret;
    
    ret = write_reg(dev, &(dev->ctrl_reg1), enable, TEMP_EN_mask, TEMP_EN_pos);
    
    return ret;
}

int lis3mdl_set_full_scale(struct lis3mdl_dev *dev, uint8_t fs_value)
{
    int ret;
    
    ret = write_reg(dev, &(dev->ctrl_reg2), fs_value, FS_mask, FS_pos);
    if(ret == LIS3MDL_OK)
        dev->scale = fs_value;
    
    return ret;
}

int lis3mdl_set_system_mode(struct lis3mdl_dev *dev, uint8_t system_mode)
{
    int ret;
    
    ret = write_reg(dev, &(dev->ctrl_reg3), system_mode, SYSTEM_MODE_mask, SYSTEM_MODE_pos);
    
    return ret;
}

int lis3mdl_read_mag_axis(struct lis3mdl_dev *dev, float *axis_values)
{
    HAL_StatusTypeDef status;
    uint8_t axis_bytes[3*sizeof(int16_t)];
    int16_t axis_word;
    int i;
    
    status = HAL_I2C_Mem_Read(dev->i2c, LIS3MDL_ADDRESS, 0x80 | OUT_X_ADDR, 1, axis_bytes, 3*sizeof(int16_t), HAL_MAX_DELAY);
    
    if(status != HAL_OK)
        return LIS3MDL_ERROR;
    
    for(i = 0; i < 3; i++)
    {
        axis_word = two_byte_to_signed(axis_bytes[2*i], axis_bytes[2*i + 1]);
        axis_values[i] = axis_word / (float)sensitivity[dev->scale];
    }
    
    return LIS3MDL_OK;
}

int lis3mdl_read_temp(struct lis3mdl_dev *dev, float *temp_value)
{
    HAL_StatusTypeDef status;
    uint8_t temp_bytes[2];
    int16_t temp_word;
    
    status = HAL_I2C_Mem_Read(dev->i2c, LIS3MDL_ADDRESS, 0x80 | TEMP_OUT_ADDR, 1, temp_bytes, sizeof(int16_t), HAL_MAX_DELAY);
    
    if(status != HAL_OK)
        return LIS3MDL_ERROR;
    
    temp_word = two_byte_to_signed(temp_bytes[0], temp_bytes[1]);
    *temp_value = 25.0f + temp_word / 8.0f;
    
    return LIS3MDL_OK;
}
