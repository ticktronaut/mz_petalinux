################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include src/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
ELFSIZE += \
matrix_multiplication_demo_linux_app.elf.size \


# All Target
all: matrix_multiplication_demo_linux_app.elf secondary-outputs

# Tool invocations
matrix_multiplication_demo_linux_app.elf: $(OBJS)  $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: ARM v7 Linux gcc linker'
	arm-linux-gnueabihf-gcc -L"/home/usappz/make/code_projects/mz_petalinux/2017_1/os/petalinux/projects/mz_openamp/build/tmp/sysroots/plnx_arm/usr/lib" -L"/home/usappz/make/code_projects/mz_petalinux/2017_1/os/petalinux/projects/mz_openamp/build/tmp/sysroots/plnx_arm/lib" -lpthread --sysroot=/home/usappz/make/code_projects/mz_petalinux/2017_1/os/petalinux/projects/mz_openamp/build/tmp/sysroots/plnx_arm -o "matrix_multiplication_demo_linux_app.elf" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

matrix_multiplication_demo_linux_app.elf.size: matrix_multiplication_demo_linux_app.elf
	@echo 'Invoking: ARM v7 Linux Print Size'
	arm-linux-gnueabihf-size matrix_multiplication_demo_linux_app.elf  |tee "matrix_multiplication_demo_linux_app.elf.size"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(EXECUTABLES)$(OBJS)$(S_UPPER_DEPS)$(C_DEPS)$(ELFSIZE) matrix_multiplication_demo_linux_app.elf
	-@echo ' '

secondary-outputs: $(ELFSIZE)

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
