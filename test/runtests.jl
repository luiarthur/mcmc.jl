using MCMC
using Test

using BangBang
using Bijectors
using Distributions
using StatsFuns
import Random
import LinearAlgebra

@testset "MCMC" begin
  include("models/simple_model.jl")
  include("models/gibbs_models.jl")
  include("metropolis.jl")
  include("mcmc.jl")
  include("misc.jl")
  include("models/gmm.jl")
  include("metrics.jl")
end
