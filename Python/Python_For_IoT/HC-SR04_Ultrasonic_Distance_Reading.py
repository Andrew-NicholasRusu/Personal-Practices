from time import sleep 
from gpiozero import DistanceSensor

# TRIG -> GPIO23 (Pin 16), ECHO -&gt; Voltage Divider -&gt; GPIO24 (Pin 18)
sensor = DistanceSensor(echo=24, trigger=23, max_distance=4) # [1, 20]

try:
    while True:
        distance_cm = sensor.distance * 100 # Convert metres to cm [20]
        print(f"Distance: {distance_cm:6.1f} cm") # [16, 20]
        sleep(0.5) # [20]
except KeyboardInterrupt:
    print("Measurement stopped.") # [20]