#include "motorcontrol.h"

#include <Stepper.h>

const int STEPS_PER_REVOLUTION = 200;
Stepper *stepper = new Stepper(STEPS_PER_REVOLUTION, 4, 5, 0, 15);

MotorControl::MotorControl(const int containersPerRotation) {
    stepper->setSpeed(60);
    
    this->containersPerRotation = containersPerRotation;
}

void MotorControl::feed() {
    stepper->step(STEPS_PER_REVOLUTION / containersPerRotation);
}

