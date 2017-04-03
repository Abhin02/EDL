#!/usr/bin/env python
"""UART sender implemented in GNURadio for AFG application."""
# -*- coding: utf-8 -*-
#
# Copyright 2017 <+YOU OR YOUR COMPANY+>.
#
# This is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3, or (at your option)
# any later version.
#
# This software is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this software; see the file COPYING.  If not, write to
# the Free Software Foundation, Inc., 51 Franklin Street,
# Boston, MA 02110-1301, USA.
#

import numpy as np
import serial
import serial.tools.list_ports
import sys

from gnuradio import gr


class uart_sender(gr.sync_block):
    """docstring for block uart_sender."""

    def __init__(self, sample_rate, signal_size, choice, mode):
        """__init__ function."""
        gr.sync_block.__init__(
            self,
            name="uart_sender",
            in_sig=[np.float32, np.float32],
            out_sig=None
        )
        self.sample_rate = sample_rate
        self.choice = choice
        self.mode = mode
        self.signal_size = signal_size - 1
        self.counter = 0
        self.ignored = 0
        self.cached = False
        self.rate_sent = False
        self.data_sent = False
        all_ports = serial.tools.list_ports.comports()
        usb_port = ""
        for x in all_ports:
            if 'USB VID:PID=067b:2303'.lower() in x[2].lower():
                usb_port = x[0]
        if not len(usb_port):
            print "Please enter USB device"
            sys.exit()
        self.ser = serial.Serial(usb_port)

    def set_choice(self, choice):
        """Callback to set value for choice."""
        self.choice = choice

    def set_mode(self, mode):
        """Callback to set value for choice."""
        self.mode = mode

    def set_sampling_freq(self, samp_rate):
        """Callback to set value for choice."""
        self.samp_rate = samp_rate

    def set_signal_size(self, signal_size):
        """Callback to set value for choice."""
        self.signal_size = signal_size

    def clean_input(self, input_sig):
        """Clean the i and q channel signals."""
        max_val = np.amax(input_sig)
        min_val = np.amin(input_sig)
        input_sig = np.abs(input_sig - min_val)
        input_sig = (255.0 / (max_val - min_val)) * input_sig
        return input_sig.astype(int)

    def work(self, input_items, output_items):
        """Outline basic workflow in GNURadio block."""
        self.counter += 1
        if self.counter <= self.ignored:
            return len(input_items[0])
        elif not self.cached:
            i_channel = input_items[0][:self.signal_size + 1]
            q_channel = input_items[1][:self.signal_size + 1]
            self.i_channel = self.clean_input(i_channel)
            self.q_channel = self.clean_input(q_channel)
            self.cached = True
        if self.choice == 1:
            # This is the idle case, don't do anything
            pass
        elif self.choice == 2 and (not self.rate_sent):
            # This is the case where sample_rate should be sent
            if self.mode == 1:
                samp_counts = \
                    int(max(int(50000000.0 / self.sample_rate) - 4, 1) / 2.0)
            else:
                samp_counts = \
                    int(max(int(50000000.0 / self.sample_rate) - 4, 1))
            if self.mode == 1:
                total_sig = 2 * self.signal_size
            else:
                total_sig = self.signal_size
            for i in range(4):
                data = samp_counts % 256
                samp_counts = samp_counts / 256
                print data
                self.ser.write(chr(data))
            for i in range(2):
                data = total_sig % 256
                total_sig = total_sig / 256
                print data
                self.ser.write(chr(data))
            self.rate_sent = True
        elif self.choice == 3 and (not self.data_sent):
            if self.mode == 1:
                for i in range(0, 2 * self.signal_size + 2):
                    if i % 2 == 0:
                        value = self.i_channel[i / 2]
                    else:
                        value = self.q_channel[(i - 1) / 2]
                    print value
                    self.ser.write(chr(value))
            else:
                for i in range(0, self.signal_size + 1):
                    value = self.i_channel[i]
                    self.ser.write(chr(value))
            self.data_sent = True

        return len(input_items[0])
