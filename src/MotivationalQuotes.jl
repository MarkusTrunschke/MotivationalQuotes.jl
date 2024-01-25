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
module MotivationalQuotes

    # Include dependencies
    using Random, DataFrames, CSV, Downloads, JLD2, FileIO, Dates, CryptoSignatures, CryptoGroups

    # Include other code files
    include("motivating_functions.jl")

    # Write your package code here.
    export motivate_me, demotivate_me, check_signature_fnc

end
