using Motivate
using Test

@testset "Motivate.jl" begin
    # Write your tests here.
    @test typeof(Motivate.motivate_me()) <: String
    @test typeof(Motivate.demotivate_me()) <: String
    @test typeof(Motivate.quoteselector(["A","B"])) <: String
end
