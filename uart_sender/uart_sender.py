"""This file sends data via UART."""
import numpy as np
import serial
import serial.tools.list_ports
import sys
import time


def sine(sample_freq, freq, sample):
    """The wrapper generates a sine wave of given frequency."""
    if sample == 1:
        return 1
    elif sample == 2:
        return 2
    value = np.sin(2 * np.pi * freq * sample * (1.0 / sample_freq))
    return int(min(value * 128 + 128, 255))


def square(sample_freq, freq, sample):
    """The wrapper genereates."""
    if sample == 1:
        return 1
    elif sample == 2:
        return 2
    value = np.sign(np.sin(2 * np.pi * freq * sample * (1.0 / sample_freq)))
    if value > 0:
        return 255
    else:
        return 0


all_ports = serial.tools.list_ports.comports()
usb_port = ""
for x in all_ports:
    if x[2] == 'USB VID:PID=067b:2303':
        usb_port = x[0]
if not len(usb_port):
    print "Please enter USB device"
    sys.exit()

ser = serial.Serial(usb_port)

samp_frequency = input("Enter sampling frequency :- ")

frequency = input("Enter frequency of wave :- ")

counts = max(int(50000000.0 / samp_frequency) - 4, 1)

dummy = raw_input("Ensure S4 is ON and S1 is OFF. Type anything to continue ")

for i in range(4):
    data = counts % 256
    counts = counts / 256
    ser.write(chr(data))

dummy = raw_input("Ensure S4 is OFF and S1 is OFF. Type anything to continue ")

for i in range(0, 8192):
    value = sine(samp_frequency, frequency, i)
    ser.write(chr(value))

time.sleep(5)
print "Data has been input. Press S1 to view it on LEDs and Headers."
