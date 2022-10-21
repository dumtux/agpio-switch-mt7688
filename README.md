# Kernel Module for enabling MT7688 Ethernet Switch

MT7688, an SoC used in routers and Omega2, has 5-ports Ethernet switch.
On Onion's Omega2(S) or Omega2(S)+ modules, this is disabled by default.

This module enables
* the Ethernet switch by modifying `AGPIO_CFG` resistor value.
* LEDs for each port by modifying `GPIO2_CFG` resistor value.

Tested on OpenWrt 22.03, with kernel version 5.10

<img src="https://github.com/dumtux/agpio-switch-mt7688/blob/develop/doc/omega2-usage-example.png?raw=true" style="width: 80%">


## Usage

### Use a custom package collection.

[TowerWrt Packages (OpenWrt Custom Packages Collection)](https://github.com/dumtux/towerwrt-packages)

### (alternative way) Hard-copying

* Clone this into your customizing OpenWRT root, e.g. into `/package/somewhere/agpioSwitch`
* comment out `sdhci` and `pwm` sections in device tree, as those pins are occupying Ethernet ports 2 and 3.
* Run `make menuconfig` and search `agpio` to see if the `kmod-agpioSwitch` is present, then select it.
* After building, flashing, and booting the built OpenWrt image, run `dmesg | grep -i agpio` to see if it's applied correctly.

```
root@Omega-736B:~# dmesg | grep -i agpio
[   60.140149] AGPIOSwitch: Switching MT7688 to 5 port ethernet mode...
root@Omega-736B:~# 
```
