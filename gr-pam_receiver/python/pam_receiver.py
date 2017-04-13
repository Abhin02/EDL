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
        self.in0 = np.array([], dtype=np.int)

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
        if self.stored is True:
            return len(input_items[0])
        print "The samples being seen are length " + str(len(self.in0))
        real = np.sign(np.real(in0))
        in0 = real.astype(int)
        self.in0 = in0 = np.concatenate((self.in0, in0), axis=0)
        if len(in0) > 70000:
            print "Error"
            self.stored = True
            return len(input_items[0])
        limit1 = (self.sample_rate / 32000.0)
        limit = limit1 * self.bits_per_symbol
        p = np.ones(limit, dtype=np.int)
        n = -1 * np.ones(limit, dtype=np.int)
        positive = np.concatenate((p, n), axis=0)
        negative = np.concatenate((n, p), axis=0)
        p1 = None
        n1 = None
        try:
            p1 = in0.tostring().index(positive.tostring()) // in0.itemsize
        except:
            pass
        try:
            n1 = in0.tostring().index(negative.tostring()) // in0.itemsize
        except:
            pass
        if p1 is not None:
            active = in0[p1:]
        elif n1 is not None:
            active = -1 * in0[n1:]
        else:
            return len(input_items[0])
        active2 = active[2*limit:]
        try:
            p2 = active2.tostring().index(positive.tostring()) // active2.itemsize
        except:
            return len(input_items[0])
        data = active[2*limit:2*limit + p2]
        signal = data[limit1/2::limit1]
        signal = 0.5 * (signal + 1)
        signal = signal.astype(int)
        output = ""
        print "Found data having " + str(len(data)) + " samples"
        print "Found signal having " + str(len(signal)) + " bits"
        for i in range(0, len(signal), 8):
            bits = [str(i) for i in signal[i:i + 8]]
            bits = "".join(bits)
            bits = bits[::-1]
            output += chr(int(bits, 2))
            print output
        print output
        print "Wrote to " + self.filename
        with open(self.filename, 'w') as f:
            f.write(output)
        self.stored = True
        return len(input_items[0])
