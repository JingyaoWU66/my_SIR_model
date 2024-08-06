module my_SIR_pkg

# Write your package code here.

export sir_model, run_simulation, plot_sir

using DifferentialEquations
using Plots

function sir_model!(du, u, p, t)
    S, I, R = u
    β, γ = p
    du[1] = -β * S * I
    du[2] = β * S * I - γ * I
    du[3] = γ * I
end

include("my_run_simulation_fun.jl")
#function run_simulation(β, γ, S0, I0, R0, tspan)
#    u0 = [S0, I0, R0]
#    p = [β, γ]
#    prob = ODEProblem(sir_model!, u0, tspan, p)
#    sol = solve(prob)
#    return sol
#end

# Plot the SIR model results
function plot_sir(sol)
    plot(sol.t, sol[1, :], label="Susceptible", xlabel="Time", ylabel="Proportion")
    plot!(sol.t, sol[2, :], label="Infected")
    plot!(sol.t, sol[3, :], label="Recovered")
end

end
