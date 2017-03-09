"""This file sends data via UART."""
import serial
import serial.tools.list_ports
import sys
import time

all_ports = serial.tools.list_ports.comports()
usb_port = ""
for x in all_ports:
    if x[2] == 'USB VID:PID=067b:2303':
        usb_port = x[0]
if not len(usb_port):
    print "Please enter USB device"
    sys.exit()

ser = serial.Serial(usb_port)

frequency = input("Enter sampling frequency :- ")

counts = max(int(50000000.0 / frequency) - 4, 1)

dummy = raw_input("Ensure S4 is ON and S1 is OFF. Type anything to continue ")

for i in range(4):
    data = counts % 256
    counts = counts / 256
    ser.write(chr(data))

dummy = raw_input("Ensure S4 is OFF and S1 is OFF. Type anything to continue ")

for i in range(0, 8192):
    ser.write(chr(i % 256))

time.sleep(5)
print "Data has been input. Press S1 to view it on LEDs and Headers."
