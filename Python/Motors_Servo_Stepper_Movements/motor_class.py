# File: chapter10/motor_class.py

# Using a L293D as a H-Bridge to control a DC Motor.

# Dependencies:
#   pip3 install pigpio

import pigpio
from time import sleep

class Motor:

    def __init__(self, pi, enable_gpio, logic_1_gpio, logic_2_gpio):

        self.pi = pi
        self.enable_gpio = enable_gpio
        self.logic_1_gpio = logic_1_gpio
        self.logic_2_gpio = logic_2_gpio

        pi.set_PWM_range(self.enable_gpio, 100) # Speed is 0..100

        # Set default state - motor not spinning and set for forward direction.
        self.set_speed(0)
        self.right()

    def right(self, speed=None):
        """
        Spin motor right.
        """
        if speed is not None:
            self.set_speed(speed)

        self.pi.write(self.logic_1_gpio, pigpio.LOW)
        self.pi.write(self.logic_2_gpio, pigpio.HIGH)

    def left(self, speed=None):
        """
        Spin motor left.
        """
        if speed is not None:
            self.set_speed(speed)

        self.pi.write(self.logic_1_gpio, pigpio.HIGH)
        self.pi.write(self.logic_2_gpio, pigpio.LOW)

    def is_right(self):                                                            # (5)
        """
        Is motor set to spin right?
        """
        return (not self.pi.read(self.logic_1_gpio)  # LOW
              and self.pi.read(self.logic_2_gpio))   # HIGH

    def set_speed(self, speed):
        """
        Set motor speed using PWM.
        """
        assert 0<=speed<=100
        self.pi.set_PWM_dutycycle(self.enable_gpio, speed)

    def brake(self):
        """
        Motor Brake (USing L293D).
        """
        was_right = self.is_right() # To restore direction after braking

        self.set_speed(100)
        self.pi.write(self.logic_1_gpio, pigpio.LOW)
        self.pi.write(self.logic_2_gpio, pigpio.LOW)
        self.set_speed(0)

        if was_right:
            self.right()
        else:
            self.left()

    def brake_pwm(self, brake_speed=100, delay_millisecs=50):
        """
        Motor Brake (Alternative using Reverse PWM).
        You may need to adjust brake_speed and delay_millisecs
        based on your physical motor and voltage/current usage.
        """
        was_right = None # To restore direction after braking

        if self.is_right():
            self.left(brake_speed)
            was_right = True
        else:
            self.right(brake_speed)
            was_right = False

        sleep(delay_millisecs / 1000)
        self.set_speed(0)

        if was_right:
            self.right()
        else:
            self.left()

