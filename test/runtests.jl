using my_SIR_pkg
using Test

function test_run_simulation()
    β = 0.3
    γ = 0.1
    S0 = 0.99
    I0 = 0.01
    R0 = 0.0
    tspan = (0.0, 160.0)
    sol = run_simulation(β, γ, S0, I0, R0, tspan)
    @test length(sol.t) > 0
    @test sol.t[end] ≈ tspan[2]
end

test_run_simulation()

