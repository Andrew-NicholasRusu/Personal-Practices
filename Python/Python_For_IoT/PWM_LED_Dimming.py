from time import sleep
from gpiozero import PWMLED

# Initialize PWm control on BCM GPIO27
led = PWMLED(27) # [10]

try:
    # 10% Duty Cycle - Dim
    led.value = 0.1 # [10, 12]
    sleep(2)

    # 90% Duty Cycle - Bright
    led.value = 0.9 # [10, 12]
    sleep(2)
finally:
    led.off() # [12]
    led.close() # [12]