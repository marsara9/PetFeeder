#include <string>

#ifndef PET_FEEDING
#define PET_FEEDING

struct Feeding {
    std::string id;
    const float cups;
    const time_t date;
};

#endif
