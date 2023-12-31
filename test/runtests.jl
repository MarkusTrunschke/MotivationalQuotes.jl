using MotivateMe
using Test

@testset "MotivateMe.jl" begin
    # Write your tests here.
    @test typeof(MotivateMe.motivate_me()) == Nothing
    @test typeof(MotivateMe.motivate_me(print_quote=false)) <: String
    @test typeof(MotivateMe.demotivate_me()) == Nothing
    @test typeof(MotivateMe.demotivate_me(print_quote=false)) <: String
    @test typeof(MotivateMe.quoteselector(["A","B"])) <: String
end
