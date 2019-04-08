################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F/port.c 

OBJS += \
./Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F/port.o 

C_DEPS += \
./Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F/port.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F/%.o: ../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM Cross C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -Og -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wall  -g3 -DUSE_HAL_DRIVER -DSTM32F407xx -I"/home/pablo/src/Magnetometer/Inc" -I"/home/pablo/src/Magnetometer/Drivers/STM32F4xx_HAL_Driver/Inc" -I"/home/pablo/src/Magnetometer/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy" -I"/home/pablo/src/Magnetometer/Middlewares/Third_Party/FreeRTOS/Source/include" -I"/home/pablo/src/Magnetometer/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS" -I"/home/pablo/src/Magnetometer/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F" -I"/home/pablo/src/Magnetometer/Drivers/CMSIS/Device/ST/STM32F4xx/Include" -I"/home/pablo/src/Magnetometer/Drivers/CMSIS/Include" -std=gnu11 -fdata-sections -ffunction-sections -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


