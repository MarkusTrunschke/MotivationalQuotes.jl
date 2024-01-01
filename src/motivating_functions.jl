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

# Motivate function
function motivate_me(;print_quote::Bool = true,category::Union{String,Array} = [])
    
    println(pwd())
    # Run motivator function
    sel_quote = motivator(cate=category, types="motivate", print_quote=print_quote)

    if print_quote == true
        return nothing
    else
        return sel_quote
    end
end

# Demotivate function
function demotivate_me(;print_quote::Bool = true,category::Union{String,Array} = [])

    # Run motivator function
    sel_quote = motivator(cate=category, types="demotivate", print_quote=print_quote)

    if print_quote == true
        return nothing
    else
        return sel_quote
    end

end

# This function does the all the quote selection and printing
function motivator(;cate="general",types="motivate",print_quote="True")

    # Read in motivational quote list
    quotelist = loadquotes_mot(cate=cate,types=types)

    # Select quote
    sel_quote = quoteselector(quotelist)

    # Print quote if option selected
    if print_quote == true
        print("\n")
        print(sel_quote)
        print("\n")
    end

    if print_quote == true
        return nothing
    else
        return sel_quote
    end
end

# Function to select the quote to display
function quoteselector(quotelist::Vector{String})

    # Get random quote
    sel_quote = quotelist[rand(eachindex(quotelist))]

    # Check if CSV.read added a second "\" in front of linebreaks and delete it if so
    sel_quote = replace(sel_quote, "\\n" => "\n")

    # There is probably a space after the linebreak. Drop it as well
    sel_quote = replace(sel_quote, "\n " => "\n")

    # Return selected quote
    return sel_quote
end

# Function to read in and select applicable quotes
function loadquotes_mot(;cate::Union{String,Array}=[],types::String="motivate")

    # Load the list of (de-)motivational quotes (get path where the module is on the current system. It comes with the module file name which we need to remove and chop 3 additional characters off because of the ".jl"-ending.)
    read_path = joinpath(@__DIR__, "data", "mot_quotes.csv")
    quote_df = CSV.read(read_path, DataFrame;header = true)

    # Select quotes of a specific category and type
    # Select type first
    mot_quotes = quote_df[quote_df.types .== types,:]

    if cate == []
        mot_quotes = mot_quotes.quotes
    elseif typeof(cate) == String
        mot_quotes.tc = occursin.(mot_quotes.cate,cate)
        mot_quotes = mot_quotes[mot_quotes.tc .== 1,:].quotes
    elseif typeof(cate) == Vector{String}
        mot_quotes.tc = mot_quotes.cate .∈ Ref(cate)
        mot_quotes = mot_quotes[mot_quotes.tc .== true,:].quotes
    end
    
    # Return prepared list
    return mot_quotes
end