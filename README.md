Airport Challenge
=================

```
        ______
        _\____\___
=  = ==(____MA____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```
[![Build Status](https://travis-ci.org/supasuma/airport_challenge.svg?branch=master)](https://travis-ci.org/supasuma/airport_challenge)

includes airport, plane and weather classes and corresponding test files.  I have taken a very similar approach to Boris Bikes in that the important functions performed are within the airport class.  I made functions related to airport capacity private.  Weather is generated by rand and a new weather object is created upon each Airport initialization.   

I wanted to implement functionality whereby each plane had a reference to its airport and use this for checking edge cases but did not have time.
