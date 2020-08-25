#include "motorcontrol.h"

#include <Arduino.h>
#include <Stepper.h>
#include <math.h>

const int RPM = 10;
const int STEPS_PER_REVOLUTION = 200;
Stepper *stepper = new Stepper(STEPS_PER_REVOLUTION, 4, 5, 2, 15);

MotorControl::MotorControl(const int containersPerRotation) {
    stepper->setSpeed(RPM);

    pinMode(0, OUTPUT);
    
    this->containersPerRotation = containersPerRotation;
}

void MotorControl::feed() {

    digitalWrite(0, HIGH);

    int totalStepsRequired = STEPS_PER_REVOLUTION / containersPerRotation;
    int stepsPerSecond = (int)(STEPS_PER_REVOLUTION * RPM / 60.0f);
    int totalLoops = floor(totalStepsRequired / stepsPerSecond);
    for(int i = 0; i < totalLoops; i++) {
        stepper->step(stepsPerSecond);
        delay(0);
    }
    stepper->step(totalStepsRequired - stepsPerSecond * totalLoops);

    digitalWrite(0, LOW);
}
