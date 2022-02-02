#!/bin/bash
#==============================================================================
# Project: 01_ledblink.sh
# Date: 02/02/22
# Author: Filippo Bilardo
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
#  Lampeggio del led collegato al connettere GPIO della Raspberry PI...
#  sudo bash 01_ledblink.sh
#
# Ver  Date      Comment
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 1.0  02/02/22  Versione iniziale
#==============================================================================

LED_PIN=18  #Physical pin 12

#Exports pin to userspace
echo $LED_PIN > /sys/class/gpio/export
# Sets pin as an output
echo "out" > /sys/class/gpio/gpio$LED_PIN/direction
# Sets LED_PIN to high value
echo "1" > /sys/class/gpio/gpio$LED_PIN/value

sleep 2 # wait 2 seconds

# Ledblink i times
i=20;
#while [ $i -ne 0 ]; #repeat while i != 0
while ((i--)) 
do
    # Sets LED_PIN to high value
    echo "1" > /sys/class/gpio/gpio$LED_PIN/value
    # wait 100 millisecond
    sleep .100
    # Set LED_PIN to low value
    echo "0" > /sys/class/gpio/gpio$LED_PIN/value
    # wait 400 millisecond
    sleep .4 

    #((i--)) # decrement i
done

# Clean up
echo $LED_PIN > /sys/class/gpio/unexport

