---
title: Using the Icestick on-board FT2232H for SPI communication with an fpga after flashing
layout: default
---

The ICE40 Icestick and ICE40 8K breakout board use a FT2232H Multipurpose UART/FIFO IC in order to write the fpga bitstream to the onboard flash over a simple usb cable.

Unfortunately, communicating with the fpga after flashing is not quite as simple. I have taken to using a [Bus-pirate](http://dangerousprototypes.com/docs/Bus_Pirate) which enables me to issue SPI commands at the fpga from my development laptop.

One nice aspect of the on-board FT2232H is that it contains not one, but dual High Speed USB to Multipurpose UART/FIFO channels. And thoughtfully, the designers of the boards wired the second channel up to the IO banks of the fpga.

That means that it should be possible to use the on-board FT2232H to flash as well as talk directly to the fpga all over a simple USB cable.


### Is it possible to use Channel-A for both programming and communicating?

Before starting to look at using the FT2223H's second channel, I wondered if it was possible to use the ftdi A Channel for both flash programming as well as communicating with the fpga.

pic of msco

Looking at the FTDi ic shows that pin 19 is not-connected. Ordinarily it would be the FTDI's SPI chip-select but instead pin 21 - a GPIO output has been appropriated for CS. This means that the programmer must manually drive the chip-select. However the extra additional has the advantage that it becomes possible to use different GPIO pins for different chip-selects for multiplexing different ICs.

So it looks like we could use another GPIO pin for fpga CS instead of flash. Unfortunately checking the schematic shows the other connected GPIO have also been dedicated - to implement fpga reset and for singalling the finish of configuration loading. With no other pins available - we instead must consider using Channel B instead.


### Programming Channel B of the FT2223H

The Icestick user mannual shows the FT2223H Channel B output connected to bank 3 of the fpga. The pin names follow a uart convention (rx/tx ttl etc) but that shouldn't matter.

The first step was to write some simple verilog to connect the expected input pins up to the board LEDs. That way I could try to programmatically control the FT2223H and toggle the fpga pins and check that the LEDs would light.

For programming the FTDI I used the libftdi USB library. As well reading FTDI own documentation, Clifford Wolf's Icestrom flash programmer [iceprog.c](https://github.com/cliffordwolf/icestorm/blob/master/iceprog/iceprog.c) provided a jump-start for some of the C code. 

The main thing is to put the ftdi device into MPSSE mode, which allows it to speak many different protocols such as SPI as well as I2C, and more.


{% highlight C %}
  if (ftdi_set_bitmode(&ftdic, 0xff, BITMODE_MPSSE) < 0) {
    fprintf(stderr, "Failed set BITMODE_MPSSE on iCE FTDI USB device.\n");
    error();
  }

{% endhighlight %}


After some experimentation, I was able to control the gpio pins of the FTDI connected to the fpga and see the expected result LED light. Additionally, when doing some FTDI's serial writes I say activity on the sclk and miso LEDs as the serial data was piped on the fpga pins.


The following mappings were then chosed for synthesis contraints file.  

{% highlight code %}

# identifier    fpga pin, uart name,  ftdi pin,     spi
set_io gpio_l2  1 #       dcd         45,   us6     gpio-l2
set_io gpio_l1  2 #       dsr         44,   us5     gpio-l1
set_io gpio_l0  3 #       dtr         43,   us4     gpio-l0     # use as cs
set_io cs       4 #       ctsn        41,   us3     cs          # ignore
set_io miso     7 #       rtsn        40,   us2     sclk
set_io mosi     8 #       tx ttl,     39,   us1     miso
set_io sclk     9 #       rx ttl,     38,   us0     mosi
{% endhighlight %}


### Using the Channel-B for communicating

The next step was to implement the Verilog code for the SPI slave. I stuck to some simple example code at [fpga4fun](https://fpga4fun.com/SPI2.html) which implement the clock domain crossing.


A simple command processor takes a byte - either 0xcc or 0xdd and turns a led off or on,

{% highlight verilog %}
  always @(posedge clk)
    begin
      if(byte_received)
        case (byte_data_received)
          8'hcc:
            led1 <= 1;
          8'hdd:
            led1 <= 0;
      endcase
    end

{% endhighlight %}


