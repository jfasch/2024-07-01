#include <sink-terminal.h>

#include <data-logger.h>

#include "conf-sensors.h"        // <--- THE extern declaration

#include <memory>
#include <iostream>


int main(int argc, char** argv)
{
    auto sink = std::make_unique<SinkTerminal>();
    DataLogger logger(conf_sensors, std::move(sink), 1000/*ms*/);
    logger.start_logging();

    return 0;
}
