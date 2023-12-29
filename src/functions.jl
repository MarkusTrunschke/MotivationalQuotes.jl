# Motivate function
function motivate_me(;print_quote::Bool = true,category::Union{String,Array} = [])
    
    println(pwd())
    # Run motivator function
    motivator(cate=category, types="motivate", print_quote=print_quote)

    if print_quote == true
        return nothing
    else
        return sel_quote
    end
end

# Demotivate function
function demotivate_me(;print_quote::Bool = true,category::Union{String,Array} = [])

    # Run motivator function
    motivator(cate=category, types="demotivate", print_quote=print_quote)

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

    # Print random number
    return sel_quote
end

# Function to read in and select applicable quotes
function loadquotes_mot(;cate::Union{String,Array}=[],types::String="motivate")

    # Load the list of (de-)motivational quotes (get path where the module is on the current system. It comes with the module file name which we need to remove and chop 3 additional characters off because of the ".jl"-ending.)
    read_path = chop(pathof(Motivate),tail=length(string(@__MODULE__))+3)*"\\data\\mot_quotes.csv"
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