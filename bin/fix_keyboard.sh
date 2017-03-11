#!/bin/bash

# Swap \| and `¬ to make the keyboard behave like a normal keyboard.
sudo bash -c "echo 0 > /sys/module/hid_apple/parameters/iso_layout"

# Default to use the Fn keys instead of media keys
sudo bash -c "echo 2 > /sys/module/hid_apple/parameters/fnmode"
