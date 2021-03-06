#!/bin/sh

# Personal Identification Pipeline - setup scripts
# https://github.com/TeamErlich/personal-identification-pipeline
#
# Copyright (C) 2016 Yaniv Erlich (yaniv@cs.columbia.edu)
# All Rights Reserved.
# This software is restricted to educational, research, not-for-profit purposes.
# See LICENSE file for full details.

set -e

# This script is setup downloads,builds and installs samtools,bwa
# for the personal-identification-pipeline.
# It assumes the current (non-root) user can run sudo
# (will ask for password if needed).
#

# Samtools instructions in  http://www.htslib.org/download/

cd /tmp

VER=1.3.1

wget https://github.com/samtools/samtools/releases/download/$VER/samtools-$VER.tar.bz2
tar -xf samtools-$VER.tar.bz2
cd samtools-$VER
./configure
make

sudo -p "Enter password for 'sudo make install' (samtools $VER): "\
    make install
