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

#ifndef _LIS3MDL_H_
#define _LIS3MDL_H_

#include "stm32f4xx_hal.h"

#define LIS3MDL_ADDRESS 0x1E

#define LIS3MDL_OK     0 
#define LIS3MDL_ERROR -1
#define LIS3MDL_BUSY  -2

#define AXIS_LOW_POWER       0
#define AXIS_MEDIUM_PERF     1
#define AXIS_HIGH_PERF       2
#define AXIS_ULTRA_HIGH_PERF 3

#define OUTPUT_RATE_0_625    0
#define OUTPUT_RATE_1_25     1
#define OUTPUT_RATE_2_5      2
#define OUTPUT_RATE_5        3
#define OUTPUT_RATE_10       4
#define OUTPUT_RATE_20       5
#define OUTPUT_RATE_40       6
#define OUTPUT_RATE_80       7
#define OUTPUT_RATE_FAST     8

#define FS_4GAUSS  0
#define FS_8GAUSS  1
#define FS_12GAUSS 2
#define FS_16GAUSS 3

#define SYS_MODE_CONTINUOUS_CONVERSION 0
#define SYS_MODE_SINGLE_CONVERSION     1
#define SYS_MODE_POWER_DOWN            2

/* Magnetometer axis */
#define X_AXIS 0
#define Y_AXIS 1
#define Z_AXIS 2

/* CTRL_REG1 */
#define FAST_ODR_mask    0x02
#define FAST_ODR_pos     1
#define OUTPUT_RATE_mask 0x1C
#define OUTPUT_RATE_pos  2
#define XYAXIS_MODE_mask 0x60
#define XYAXIS_MODE_pos  5
#define TEMP_EN_mask     0x80
#define TEMP_EN_pos      7

/* CTRL_REG2 */
#define SOFT_RST_mask 0x04
#define SOFT_RST_pos  2
#define REBOOT_mask   0x08
#define REBOOT_pos    3
#define FS_mask       0x60
#define FS_pos        5

/* CTRL_REG3 */
#define SYSTEM_MODE_mask 0x03
#define SYSTEM_MODE_pos  0

/* CTRL_REG4 */
#define ZAXIS_MODE_mask 0x0C
#define ZAXIS_MODE_pos  2

/* Register addresses */
#define CTRL_REG1_ADDR  0x20
#define CTRL_REG2_ADDR  0x21
#define CTRL_REG3_ADDR  0x22
#define CTRL_REG4_ADDR  0x23
#define CTRL_REG5_ADDR  0x24

#define STATUS_REG_ADDR 0x27

#define OUT_X_ADDR      0x28
#define OUT_Y_ADDR      0x2A
#define OUT_Z_ADDR      0x2C

#define TEMP_OUT_ADDR   0x2E

/* Reset values */
#define CTRL_REG1_RESET_VAL 0x10
#define CTRL_REG2_RESET_VAL 0x00
#define CTRL_REG3_RESET_VAL 0x03
#define CTRL_REG4_RESET_VAL 0x00

struct lis3mdl_reg
{
    uint8_t address;
    uint8_t value;
};

struct lis3mdl_dev
{
    I2C_HandleTypeDef *i2c;

    struct lis3mdl_reg ctrl_reg1;
    struct lis3mdl_reg ctrl_reg2;
    struct lis3mdl_reg ctrl_reg3;
    struct lis3mdl_reg ctrl_reg4;

    int scale;
};

/**
 * \brief Initialize LIS3MDL driver and reset the device.
 * \param dev Pointer to a device driver instance to be initialized by this function.
 * \param i2c Pointer to the handle for the I2C bus where the sensor is connected.
 * \return Status, OK or error.
 */
int lis3mdl_init(struct lis3mdl_dev *dev, I2C_HandleTypeDef *i2c);

/**
 * \brief Reset all LIS3MDL registers.
 * \param dev Pointer to driver instance.
 * \return Status, OK or error.
 */
int lis3mdl_reset(struct lis3mdl_dev *dev);

/**
 * \brief Set axis operative mode.
 * \param dev Pointer to driver instance.
 * \param xy_axis_mode Operating mode for X and Y axis.
 * \param z_axis_mode Operating mode for Z axis.
 * \return Status, OK or error.
 */
int lis3mdl_set_axis_mode(struct lis3mdl_dev *dev, uint8_t xy_axis_mode, uint8_t z_axis_mode);

/**
 * \brief Set output data rate.
 * \param dev Pointer to driver instance.
 * \param output_data_rate Output data rate for the sensor.
 * \return Status, OK or error.
 */
int lis3mdl_set_output_data_rate(struct lis3mdl_dev *dev, uint8_t output_data_rate);

/**
 * \brief Enable or disable temperature sensor.
 * \param dev Pointer to driver instance.
 * \param enable 0 to disable, 1 to enable temperature sensor.
 * \return Status, OK or error.
 */
int lis3mdl_enable_temp_sensor(struct lis3mdl_dev *dev, uint8_t enable);

/**
 * \brief Set full scale value.
 * \param dev Pointer to driver instance
 * \param fs_value Full scale value.
 * \return Status, OK or error.
 */
int lis3mdl_set_full_scale(struct lis3mdl_dev *dev, uint8_t fs_value);

/**
 * \brief Set system operating mode.
 * \param dev Pointer to driver instance.
 * \param system_mode System operating mode.
 * \return Status, OK or error.
 */
int lis3mdl_set_system_mode(struct lis3mdl_dev *dev, uint8_t system_mode);

/**
 * \brief Read magnetometer data (all three axis).
 * \param[in] dev Pointer to driver instance.
 * \param[out] axis_value Axis readings array in gauss. Index 0 is X, 1 is Y and 2 is Z.
 * \return Status, OK or error.
 */
int lis3mdl_read_mag_axis(struct lis3mdl_dev *dev, float *axis_values);

/**
 * \brief Read temperature.
 * \param[in] dev Pointer to driver instance.
 * \param[out] temp_value Temperature in degrees Celsius.
 * \return Status, OK or error.
 */
int lis3mdl_read_temp(struct lis3mdl_dev *dev, float *temp_value);

#endif /* _LIS3MDL_H_ */
