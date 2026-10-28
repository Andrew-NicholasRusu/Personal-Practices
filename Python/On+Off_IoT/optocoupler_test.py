# Dependencies:
#   pip3 install pigpio

import pigpio
from time import sleep

GPIO_PIN = 21
pi = pigpio.pi()

try:
    # Note: Circuit is wired as ACTIVE LOW
    pi.write(GPIO_PIN, pigpio.LOW) # On.
    print("On")
    sleep(2)
    pi.write(GPIO_PIN, pigpio.HIGH) # Off
    print("Off")
    sleep(2)

except KeyboardInterrupt:
    print("Bye")

finally:
    pi.write(GPIO_PIN, pigpio.HIGH) # Off
    pi.stop() # PiGPIO cleanup
    