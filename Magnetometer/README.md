LIS3MDL driver and application
==============================
This repository contains code for configuring and reading LIS3MDL magnetic sensor using a STM32F4 MCU. It has a sensor driver and an example project to get the temperature and magnetic field every second.

LIS3MDL driver description
--------------------------
This driver exposes the following features:

* I2C interface
* Axis mode, output data rate and system operating mode configuration.
* Full scale selection.
* Magnetic field and temperature reading.

It makes use of STM32F4 hardware abstraction layer (HAL) in order to access I2C bus.

It is possible to control multiple sensors, as one of the driver's parameters is an instance variable which has a pointer to the I2C handle from the HAL and stores sensor's configuration registers values and addresses. This way it is not necessary to read them from the hardware, as they are cached in RAM.

STM32F4 project
-------------------
The project was first generated using STM32CubeMX, which creates all hardware initialization code using STM32 HAL. The following board parameters were used:

* MCU: STM32F407VG
* 168 MHz clock speed from a 8 MHz crystal.
* PB7 as I2C1 SDA and PB6 as I2C1 SCL.
* PD7 as GPIO external interrupt 7.
* I2C1 in fast mode (400 kHz).

FreeRTOS was also included through the CMSIS-RTOS V1 interface in order to use threads for sensor reading and other tasks.

First, a Makefile project was generated. Then all code files were copied to a new Eclipse ([with extensions for microcontroller programming](https://gnu-mcu-eclipse.github.io/)) project with the same compiler and linker options as the generated Makefile. This had to be done because STM32CubeMX doesn't automatically generate an Eclipse project.

There is a single FreeRTOS task for sensor reading. DRDY pin is assumed to be connected to PD7 external interrupt pin. First, this task sets the sensor output data rate to 10 Hz and waits for a signal. The external interrupt handler counts 10 interrupts and then it sends a CMSIS-RTOS signal to the reading thread so that it wakes up and reads the magnetic field and temperature values from the sensor, which are then stored in a global structure.

All driver functions use blocking I/O in order not to overcomplicate the code with interrupts and message queues. This is not a problem because a higher priority task (for example, a real time control system) can preempt the sensor task.

Finally, STM32CubeMX project file is also included (magnetometer_stm32f4.ioc).
