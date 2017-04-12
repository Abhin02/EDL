#!/usr/bin/env python
"""Basic PAM receiver in GNURadio."""
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


class pam_receiver(gr.sync_block):
    """Docstring for block pam_receiver."""

    def __init__(self, bits_per_symbol, sample_rate, filename):
        """Standard __init__ function."""
        gr.sync_block.__init__(
            self,
            name="pam_receiver",
            in_sig=[np.complex64],
            out_sig=None
        )
        self.sample_rate = sample_rate
        self.bits_per_symbol = bits_per_symbol
        self.filename = filename
        self.stored = False

    def set_sampling_rate(self, sample_rate):
        """Callback for sample rate."""
        self.sample_rate = sample_rate

    def set_bits_per_symbol(self, bits_per_symbol):
        """Callback for bits per symbol."""
        self.bits_per_symbol = bits_per_symbol

    def set_filename(self, filename):
        """Callback for filename."""
        self.filename = filename

    def work(self, input_items, output_items):
        """Decode the signal."""
        in0 = input_items[0]
        in0 = in0[4::8]
        real = np.real(in0)
        imag = np.imag(in0)
        bits = []
        for i in range(len(real)):
            if abs(real[i]) > abs(imag[i]):
                bit = np.sign(real[i])
            else:
                bit = -np.sign(imag[i])
            bits.append(bit)
        bits = [max(0, int(i)) for i in bits]
        bits = bits[self.bits_per_symbol:]
        bits = [str(i) for i in bits]
        output = ""
        for i in range(0, len(bits), 8):
            bit_pattern = "".join(bits[i:i+8])
            data = chr(int(bit_pattern, 2))
            output += bit_pattern
        if self.stored is False:
            self.stored = True
            with open(self.filename, 'w') as f:
                f.write(output)
        return len(input_items[0])

