
#ifndef PET_MOTOR
#define PET_MOTOR

class MotorControl {
public:
    MotorControl(const int containersPerRotation);
    void feed();
private:
    float minimumDispenceAmount;
    int containersPerRotation;
};

#endif