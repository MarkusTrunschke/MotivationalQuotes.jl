using MotivationalQuotes, Test, FileIO, JLD2, CryptoSignatures, CryptoGroups


quotepath = joinpath(@__DIR__, "data", "mot_quotes.csv")
signature = load(joinpath(@__DIR__, "data", "signature_mot_quotes.jld2"), "signature_mot_quotes")

@testset "MotivationalQuotes.jl" begin
    # Write your tests here.
    @test typeof(MotivationalQuotes.motivate_me()) == Nothing
    @test typeof(MotivationalQuotes.motivate_me(print_quote=false)) <: String
    @test typeof(MotivationalQuotes.demotivate_me()) == Nothing
    @test typeof(MotivationalQuotes.demotivate_me(print_quote=false)) <: String
    @test typeof(MotivationalQuotes.quoteselector(["A","B"])) <: String
    @test MotivationalQuotes.check_signature_fnc(quotepath,signature) == true
end