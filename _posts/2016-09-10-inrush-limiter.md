---
title: Inrush limiter for toroidal transformer 
layout: about
---

![clamps](http://s3.julian1.io/rx100/smaller/DSC01877.JPG)

When a toroidal transformer is first switched it can have up to 60 times inrush to running current. 

The circuit protects against inrush current by using a series resistor.

A relay controlled by a simple timer shorts the resistor when the toroid has built up its magnetic inductance.

The resistor is an NTC type. This protects the resistor from being destroyed if the relay suffers mechanical failure - since the NTC resistance will fall as it heats from the load. 

Under normal operating conditions the NTC is shorted and stays cool. This allows the circuit to provide resistance and limit inrush even if power is rapidly cycled. 

The timing has been slowed for testing. 

 <video width="700" height="400" controls>
  <source src="http://s3.julian1.io/rx100/100ANV01/MAH01872.MP4" type="video/mp4">
  <source src="http://s3.julian1.io/rx100/100ANV01/MAH01872.MP4" type="video/ogg">
  Your browser does not support the video tag.
</video> 


