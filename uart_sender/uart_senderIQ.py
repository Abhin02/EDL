"""This file sends data via UART."""
import numpy as np
import serial
import serial.tools.list_ports
import sys
import time


def cosine(sample_freq, freq, sample):
    """The wrapper generates a sine wave of given frequency."""
    # elif sample == 2:
    #     return 2
    value = np.cos(2 * np.pi * freq * sample * (1.0 / sample_freq))
    return int(min(value * 128 + 128, 255))


def sine(sample_freq, freq, sample):
    """The wrapper generates a sine wave of given frequency."""
    # elif sample == 2:
    #     return 2
    value = np.sin(2 * np.pi * freq * sample * (1.0 / sample_freq))
    return int(min(value * 128 + 128, 255))


def square(sample_freq, freq, sample):
    """The wrapper generates square waves."""
    value = np.sign(np.sin(2 * np.pi * freq * sample * (1.0 / sample_freq)))
    if value > 0:
        return 255
    else:
        return 0


all_ports = serial.tools.list_ports.comports()
usb_port = ""
for x in all_ports:
    if 'USB VID:PID=067b:2303'.lower() in x[2].lower():
        usb_port = x[0]
if not len(usb_port):
    print "Please enter USB device"
    sys.exit()

ser = serial.Serial(usb_port)

samp_frequency = input("Enter sampling frequency :- ")

frequency = input("Enter frequency of wave :- ")

# Sending sample rate
# The / 2 factor ensures that sample frequency is doubled
samp_counts = int(max(int(50000000.0 / samp_frequency) - 4, 1) / 2.0)

sig_size = max(int(samp_frequency / float(frequency)), 1) - 1
sig_size2 = sig_size

dummy = raw_input("Ensure S4 is ON and S1 is OFF. Type anything to continue ")

for i in range(4):
    data = samp_counts % 256
    samp_counts = samp_counts / 256
    ser.write(chr(data))

# Sending signal size
total_sig = sig_size + sig_size2
for i in range(2):
    data = total_sig % 256
    total_sig = total_sig / 256
    ser.write(chr(data))

dummy = raw_input("Ensure S4 is OFF and S1 is OFF. Type anything to continue ")

for i in range(0, sig_size + sig_size2 + 2):
    if i % 2 == 0:
        value = sine(samp_frequency, frequency, i / 2)
    else:
        value = cosine(samp_frequency, frequency, (i - 1) / 2)
    print value
    ser.write(chr(value))

time.sleep(1)
print "Data has been input. Press S1 to view it on LEDs and Headers."
