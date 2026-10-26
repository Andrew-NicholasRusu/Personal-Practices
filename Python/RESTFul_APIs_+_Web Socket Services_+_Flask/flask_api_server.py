# A HTTP RESTFul API server to control an LED built using Flask-RESTful.

# Dependencies:
#   pip3 install gpiozero pigpio flask-restful

import logging
from flask import Flask, request, render_template                                    
from flask_restful import Resource, Api, reqparse, inputs                            
from gpiozero import PWMLED, Device                                                  
from gpiozero.pins.pigpio import PiGPIOFactory

# Initialize Logging
logging.basicConfig(level=logging.WARNING) # Global logging configuration
logger = logging.getLogger('main') # Logger for this module
logger.setLevel(logging.INFO)   # Debugging for this file

# Initialize GPIOZero
Device.pin_factory = PiGPIOFactory() #set GPIOZero to use PiGPIO by default

# Flask & Flask-RESTful instance variables
app = Flask(__name__) # Core Flask app
api = Api(app) # Flask-RESTful extension wrapper

# Global variables
LED_GPIO_PIN = 21
led = None # PWMLED Instance. See init_led()
state = {
    'level': 50 # % brightness of LED
}

"""
GPIO Related Functions
"""
def init_led():
    """Create and initialize an PWMLED Object"""
    global led
    led = PWMLED(LED_GPIO_PIN)
    led.value = state['level'] / 100

"""
Flask & Flask-Restful Related Functions
"""

# @app.route applies to the core Flask instance (app).
# Here we are serving a simple web page.
@app.route('/', methods=['GET'])   
def index():
    """Make sure inde.html is in the templayes folder
    relative to this Python file."""     
    return render_template('index_api_client.html', pin=LED_GPIO_PIN)

# Flask-restful resource definitions.
# A 'resource' is modeled as a Python Class.
class LEDControl(Resource):

    def __init__(self):
        self.args_parser = reqparse.RequestParser()

        self.args_parser.add_argument(
            name='level', # Name of argument
            required=True, # Mandatory argument
            type=inputs.int_range(0, 100), # Allowed range 0..100
            help='Set LED brightness level {error_msg}',
            default=None)

    def get(self):
        """ Handles HTTP GET requests to return current LED state. """
        return state 

    def post(self):
        """ Handles HTTP POST requests to set LED brightness level. """
        global state 

        args = self.args_parser.parse_args()

        # Set PWM duty cycle to adjust brightness level
        state['level'] = args.level
        led.value = state['level'] / 100
        logger.info("LED brightness level is " + str(state['level']))

        return state

# Initialise Module
init_led()
# Register Flask-RESTful resource and mount to server end point /led
api.add_resource (LEDControl, '/led')

if __name__ == '__main__':

     # If you have debug=True and receive the error "OSError: [Errno 8] Exec format error", then:
    # remove the execuition bit on this file from a Terminal, ie:
    # chmod -x flask_api_server.py
    #
    # Flask GitHub Issue: https://github.com/pallets/flask/issues/3189
    app.run(host="0.0.0.0", debug=True)

