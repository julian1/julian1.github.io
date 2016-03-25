---
title: Inrush limiter for toroidal transformer 
layout: about
---

Toroidal transformers, when first switched on can have up to 60 times inrush to running current. 

This circuit protects against inrush current by using a series resistor.

A relay controlled by a simple timer shorts the resistor until the toroid has built up its magnetic inductance.

The resistor is an NTC type, which means if the relay fails, the resistor (which is under-rated for the full line power) won't be destroyed as the NTC resistance falls as it heats.

Under normal operating conditions the NTC stays cool. This allows the circuit to provide resistance and limit inrush even if power is rapidly cycled. 

The timer is deliberately slowed for testing purpose. 

 <video width="700" height="400" controls>
  <source src="http://s3.julian1.io/rx100/100ANV01/MAH01872.MP4" type="video/mp4">
  <source src="http://s3.julian1.io/rx100/100ANV01/MAH01872.MP4" type="video/ogg">
  Your browser does not support the video tag.
</video> 


