import time
from gpiozero import LED, Button

# Initialize LED on BCM GPIO17 and Button on BCM GPIO18 (internal pull-up enabled)
led = LED(17)
button = Button(18)

try:
    print("Press button to turn on LED. Ctrl + C to exit.")
    while True:
        if button.is_pressed: # Checks if button = grounded
            led.on()
        else:
            led.off()
        time.sleep(0.1)
except KeyboardInterrupt:
    print("\nProgram interrupted.")
finally:
    led.off()
    led.close() # Free GPIO resource on exit

