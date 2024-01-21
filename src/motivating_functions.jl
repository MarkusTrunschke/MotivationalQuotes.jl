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
function motivate_me(;print_quote::Bool = true, category::Union{String,Array} = [], nodownload::Bool=false)
    
    println(pwd())
    # Run motivator function
    sel_quote = motivator(cate=category, types="motivate", print_quote=print_quote, nodownload = nodownload)

    if print_quote == true
        return nothing
    else
        return sel_quote
    end
end

# Demotivate function
function demotivate_me(;print_quote::Bool = true, category::Union{String,Array} = [], nodownload::Bool=false)

    # Run motivator function
    sel_quote = motivator(cate=category, types="demotivate", print_quote=print_quote, nodownload = nodownload)

    if print_quote == true
        return nothing
    else
        return sel_quote
    end

end

# This function does the all the quote selection and printing
function motivator(;cate="general", types="motivate", print_quote="True", nodownload::Bool=false)

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

    # Return selected quote
    return sel_quote
end

# Function to read in and select applicable quotes
function loadquotes_mot(;cate::Union{String,Array}=[],types::String="motivate", nodownload::Bool=false)

    # Define path to quote file
    quote_path = joinpath(@__DIR__, "data", "mot_quotes.csv")

    # Download newest list of quotes from DataHub if not blocked by user, network is available and last download time-stamp is older than a week
    if nodownload == false

        # Read in last download's time-stamp from file
        last_download_path = joinpath(@__DIR__, "data", "last_download_date.jld2")
        last_download_date = load(last_download_path, "last_download_date")

        # Download new data if last download is older than 7 days
        if Day(today() - last_download_date) > Day(7) == true
            download_fnc()
        end
    end

    # Load the list of (de-)motivational quotes (get path where the module is on the current system. It comes with the module file name which we need to remove and chop 3 additional characters off because of the ".jl"-ending.)
    quote_df = CSV.read(quote_path, DataFrame;header = true)

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

# Download fnc
function download_fnc()

    try 
        # Data URL (my Github data hub)
        data_url = "https://raw.githubusercontent.com/MarkusTrunschke/MarkusDataHub/main/MotivationalQuotes.jl-Data/mot_quotes.csv"
            
        # Download quote CSV file and save
        Downloads.download(data_url, quote_path)

        # Check signature of downloaded file
        check_sign_fnc()
            
        # Save today as the last download date
        save(last_download_path, Dict("last_download_date" => today()))

    catch
        # Do nothing if download fails. Only continue to read in excisting file (worst case: shipped with package)
    end

    # Return nothing b/c everything it has to do is saving the file
    return nothing
end

# Check signature of the downloaded file fnc
function check_sign_fnc()

    # Hard-code public signature key
    public_key = 
    # CONTINUE HERE! THE PUBLIC KEY WILL BE HARD-CODED INTO THIS PACKAGE. THE PRIVATE KEY IS ONLY FOR ME. AND THE SIGNATURE WILL BE FOR DOWNLOAD ON MY GITHUB DATA REPOSITORY.
    # THE CODE WILL VERIFY THE CSV FILE USING THE PUBLIC KEY AND THE SIGNATURE. THIS WORKS BECAUSE NO ONE BUT ME CAN GENERATE A SIGNATURE THAT FITS TO BOTH THE PUBLIC KEY AND THE CSV FILE.
    # AT LEAST IN THEORY.

end