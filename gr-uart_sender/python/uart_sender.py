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
from gnuradio import gr


class uart_sender(gr.sync_block):
    """docstring for block uart_sender."""

    def __init__(self, sample_rate, choice):
        """__init__ function."""
        gr.sync_block.__init__(
            self,
            name="uart_sender",
            in_sig=[np.float32, np.float32],
            out_sig=None
        )
        self.sample_rate = sample_rate
        self.choice = choice

    def set_choice(self, choice):
        """Callback to set value for choice."""
        self.choice = choice

    def set_sampling_freq(self, samp_rate):
        """Callback to set value for choice."""
        self.samp_rate = samp_rate

    def work(self, input_items, output_items):
        """Outline basic workflow in GNURadio block."""
        in0 = input_items[0]
        in1 = input_items[1]
        print self.choice
        return len(input_items[0])
