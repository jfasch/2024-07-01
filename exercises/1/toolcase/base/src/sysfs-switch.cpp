#include "sysfs-switch.h"

#include "file-util.h"

#include <fcntl.h>
#include <unistd.h>
#include <cstring>
#include <iostream>


SysFSGPIOSwitch::SysFSGPIOSwitch(int gpioPin) : pinNumber(gpioPin)
{
    exportGPIO();
    usleep(100000); // 0.1s sleep (assumed value that can be adjusted if necessary)
    configureOutput();
}

SysFSGPIOSwitch::~SysFSGPIOSwitch()
{
    unexportGPIO();
}

void SysFSGPIOSwitch::set_state(bool state)
{
    std::string valueFilePath = "/sys/class/gpio/gpio" + std::to_string(pinNumber) + "/value";
    write_sysfs_file(valueFilePath, (state ? "1" : "0"));
}

bool SysFSGPIOSwitch::get_state()
{
    std::string value = read_sysfs_file("/sys/class/gpio/gpio" + std::to_string(pinNumber) + "/value");
    return value == "1";
}

void SysFSGPIOSwitch::exportGPIO()
{
    static const std::string export_file = "/sys/class/gpio/export";
    write_sysfs_file(export_file, std::to_string(pinNumber));
}

void SysFSGPIOSwitch::configureOutput()
{
    std::string directionFilePath = "/sys/class/gpio/gpio" + std::to_string(pinNumber) + "/direction";
    write_sysfs_file(directionFilePath, "out");
}

void SysFSGPIOSwitch::unexportGPIO()
{
    static const std::string unexport_file = "/sys/class/gpio/unexport";
    write_sysfs_file(unexport_file, std::to_string(pinNumber));
}
