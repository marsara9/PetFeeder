
#ifndef PET_MOTORCONTROL
#define PET_MOTORCONTROL

class MotorControl {
public:
    MotorControl(const int containersPerRotation);
    void feed();
private:
    int containersPerRotation;
};

#endif
