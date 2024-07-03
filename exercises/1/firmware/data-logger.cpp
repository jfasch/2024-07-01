#include <sensor-const.h>
#include <sensor-random.h>
#include <sink-terminal.h>
#ifdef HAVE_SQLITE3
#  include <sink-sqlite3.h>
#endif
#include <data-logger.h>

#include <memory>
#include <iostream>


int main(int argc, char** argv)
{
#   ifdef HAVE_SQLITE3
    if (argc != 2) {
        std::cerr << "Usage: " << argv[0] << " <SQLITE3-DB-FILE>" << '\n';
        std::cerr << "    " << SinkSQLite3::create_table_statement << '\n';
        return 1;
    }
    std::string dbfile = argv[1];
#   endif

    auto bottom_left = std::make_unique<ConstantSensor>(37.5);
    auto bottom_right = std::make_unique<ConstantSensor>(-273.15);
    auto top_left = std::make_unique<RandomSensor>(0, 666);
    auto top_right = std::make_unique<RandomSensor>(-273.15, 0);

    SensorConfig config;
    config.add_sensor("bl", std::move(bottom_left));
    config.add_sensor("br", std::move(bottom_right));
    config.add_sensor("tl", std::move(top_left));
    config.add_sensor("tr", std::move(top_right));
    
#   ifdef HAVE_SQLITE3
    auto sink = std::make_unique<SinkSQLite3>(dbfile);
#   else
    auto sink = std::make_unique<SinkTerminal>();
#   endif
    DataLogger logger(config, std::move(sink), 1000/*ms*/);
    logger.start_logging();

    return 0;
}
