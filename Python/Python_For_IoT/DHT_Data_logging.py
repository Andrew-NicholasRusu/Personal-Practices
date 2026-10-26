import time 
from datetime import datetime
import board
import adafruit_dht

# Configure GHT11 on BCm GPIO21 (Physical Pin 40)
dht = adafruit_dht.DHT11(board.D21) # [18, 19]
log_file = "temperature_log.txt"

try:
    while True:
        try:
            temp = dht.temperature # Read temperature in C [19]
            humidity = dht.humidity # Read relative humidity % [19]
            now = datetime.now().strftime("%Y-%m-%d %H:%M:%S") # [19]

            line = f"{now} | Temp: {temp:.1f} C | Humidity: {humidity:.1f}%\n"
            print(line.strip())

            # Append reading to log file
            with open (log_file, "a") as f: # [19]
                f.write(line) # [19]

        except RuntimeError as error:
            # DHT sensors frequently drop frame timing; catch and retyr loop
            print(f"Sensor read error {error}") # [19]

        time.sleep(30) # Logging interval 
except KeyboardInterrupt:
    pass
finally:
    dht.exit() # Clean up DHT background thread