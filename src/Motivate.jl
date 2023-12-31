#####################################################
################ THE MOTIVATE PACKAGE ###############
# Author: Markus Trunschke                          #
# Date of first version: 29.12.2023                 #
# Contact: markus.trunschke@googlemail.com          #
#####################################################
# Notes: This very simple package is based on Stata #
#        packages "motivate.ado" and                #
#        and "demotivate.ado" from Kabira Namit     #
#        (World Bank, knamit@worldbank.org)         #
#####################################################

# Define module
module Motivate

    # Include dependencies
    using Random, DataFrames, CSV

    # Include other code files
    include("motivating_functions.jl")

    # Write your package code here.
    export motivate_me, demotivate_me

end
