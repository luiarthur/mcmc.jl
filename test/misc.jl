@testset "wsample_logprob" begin
  p = [.3, .5, .2]
  logp = log.(p)

  Random.seed!(1234)
  x = wsample_logprob(logp, 100_000)
  @test isapprox(mean(x .== 1), p[1], atol=1e-2)
  @test isapprox(mean(x .== 2), p[2], atol=1e-2)
  @test isapprox(mean(x .== 3), p[3], atol=1e-2)
end
