using Pkg
Pkg.activate()

#Pkg.add(path="/path/to/your/package/my_SIR_pkg")
Pkg.add(path="/Users/jingyaowu/.julia/dev/my_SIR_pkg")
#Pkg.add("my_SIR_pkg")
Pkg.status()
Pkg.instantiate()
using Revise
using my_SIR_pkg

# Define parameters for the SIR model
β = 0.3
γ = 0.1
S0 = 0.99
I0 = 0.01
R0 = 0.0
tspan = (0.0, 160.0)

# Run the simulation
sol = my_SIR_pkg.run_simulation(β, γ, S0, I0, R0, tspan)

# Print the results
println("Simulation results:")
println("Time: ", sol.t)
println("S: ", sol[1, :])
println("I: ", sol[2, :])
println("R: ", sol[3, :])

# Plot the results
my_SIR_pkg.plot_sir(sol)
