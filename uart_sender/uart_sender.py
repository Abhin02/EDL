"""This file sends data via UART."""

import serial
ser = serial.Serial('/dev/ttyUSB0')
ser.write(b'A')
