# Motivate

This fun package greets you with a random motivating quote. In case you feel too motivated you can use the `demotivate_me` command to bring you down to earth again.

# Installation
Via the Julia package manager:
```
import Pkg; Pkg.add("Motivate")
```
# Usage
Use the following command to print a motivating quote
```
motivate_me()
```
If you want to be demotivated use this command
```
demotivate_me
```
You can select topics by using the `topics` argument and you can return the quite instead of printing it using `print_quote` (true/false).
Currently, the only available topics are: general, academia, economics

# Package status
This package is currently under continuous development. The main focus for now is to expand the number of quotes and topics.
Any suggestions are welcome.
