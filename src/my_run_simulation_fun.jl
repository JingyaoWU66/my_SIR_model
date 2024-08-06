function run_simulation(β, γ, S0, I0, R0, tspan)
    u0 = [S0, I0, R0]
    p = [β, γ]
    prob = ODEProblem(sir_model!, u0, tspan, p)
    sol = solve(prob)
    return sol
end