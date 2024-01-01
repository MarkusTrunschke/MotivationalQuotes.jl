using MotivationalQuotes
using Test

@testset "MotivationalQuotes.jl" begin
    # Write your tests here.
    @test typeof(MotivationalQuotes.motivate_me()) == Nothing
    @test typeof(MotivationalQuotes.motivate_me(print_quote=false)) <: String
    @test typeof(MotivationalQuotes.demotivate_me()) == Nothing
    @test typeof(MotivationalQuotes.demotivate_me(print_quote=false)) <: String
    @test typeof(MotivationalQuotes.quoteselector(["A","B"])) <: String
end
