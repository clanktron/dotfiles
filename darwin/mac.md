---
author: Clayton Castro
datetime: 2023-01-15:23:35
title: MacOS Customization
slug: ""
featured: true
draft: false
tags:
  - dotfiles
  - IAC
ogImage: ""
description:
  Mac Setup
---

## Todo
import/export embedded preferences:
- itsycal settings `com.mowglii.ItsycalApp`
- login item settings
- calendars?
- mail?
- hidutil  -caps to control [key](https://developer.apple.com/library/archive/technotes/tn2450/_index.html#//apple_ref/doc/uid/DTS40017618-CH1-KEY_TABLE_USAGES)

# Notes for mac setup
> these should eventually be translated to an ansible or bash script (or some other iac tool)

## symlink mac system utilities as their linux equivalents
```bash
ln -sf /usr/sbin/diskutil /usr/local/sbin/lsblk
# this is the only one i've found a reason to do so far
```
## usb port continuous disconnect reconnect
```bash
# dunno why killing this daemon solved it
# it lowers power output (when killed)
sudo killall -STOP -c usbd
```
## esp32 development
- compilation tools are installed at $HOME/.espressif
- can be changed with `IDF_TOOLS_PATH` env var (before install script is run)
- tooling is all set up through a specific branch of their repo (a little weird but alright)
```bash
# branch for version
git clone -b v5.1 --recursive https://github.com/espressif/esp-idf.git
```
- drivers also need to be installed
```bash
brew install --cask silicon-labs-vcp-driver
# above one requires a graphical install
brew install --cask ftdi-vcp-driver
# this one requires a reboot
```
## apple system defaults

export/import settings:
```bash
defaults export com.apple.dock dock.plist
# other machine
defaults import com.apple.dock dock.plist
```
- caps lock to control
- autohide menu bar
- background shows no files
