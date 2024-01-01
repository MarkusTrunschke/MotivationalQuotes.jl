# MotivateMe

This fun package greets you with a random motivating quote. In case you feel too motivated you can use the `demotivate_me` command to bring you down to earth again.

# Installation
Via the Julia package manager:
```
import Pkg; Pkg.add("MotivateMe")
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
You can select topics by using the `topics` argument and you can return the quote instead of printing it using `print_quote` (true/false).
Currently, the only available topics are: general, academia, economics

# Options
The following options are available.
`topics` allows to select a specific topic of quotes
`print_quote` (true/false) either prints the quote as output or only returns the quote. Default is `true`.
`nodownload` (true/false) surpresses the attempt to download new quotes (once a week) from my DataHub. Default is `false`.

# Package status
This package is currently under continuous development. The main focus for now is to expand the number of quotes and topics.
Any suggestions are welcome.
