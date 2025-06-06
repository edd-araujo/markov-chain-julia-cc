# Markov Chain Model for Influenza Disease Progression
# States: S (Suscetível), I (Infectado), R (Recuperado), C (Complicações)

using LinearAlgebra
using Printf

function simulate_influenza_progression(; days_to_simulate = 30, initial_population = [990, 10, 0, 0], print_interval = 5)

    # Order of states: [S, I, R, C]
    transition_matrix = [
        0.97 0.03 0.00 0.00;  # S
        0.00 0.85 0.10 0.05;  # I
        0.00 0.00 1.00 0.00;  # R
        0.00 0.00 0.15 0.85   # C
    ]

    println("\nMatriz de Transição:\n")
    state_names = ["S", "I", "R", "C"]
    for i in 1:4
        println("- $(state_names[i]) -> ", transition_matrix[i, :])
    end
    println()

    # Initial population
    population_total = sum(initial_population)

    println("População Inicial:\n")
    println("- Suscetíveis (S): $(initial_population[1])")
    println("- Infectados (I): $(initial_population[2])")
    println("- Recuperados (R): $(initial_population[3])")
    println("- Complicações (C): $(initial_population[4])")
    println("- Total: $population_total")
    println()

    # Simulation
    history = zeros(Int, days_to_simulate + 1, 4)
    history[1, :] = initial_population
    current_population = copy(initial_population)

    println("Iniciando simulação por $days_to_simulate dias...\n")
    println(" - Dia 0 -> S = $(current_population[1]), I = $(current_population[2]), R = $(current_population[3]), C = $(current_population[4])")

    for day in 1:days_to_simulate
        
        new_population = transition_matrix' * current_population
        rounded_population = round.(Int, new_population)

        difference = population_total - sum(rounded_population)
        state_to_adjust = argmax(rounded_population)
        rounded_population[state_to_adjust] += difference

        current_population = rounded_population
        history[day+1, :] = current_population

        if day % print_interval == 0 || day == 1
            println(" - Dia $day -> S = $(current_population[1]), I = $(current_population[2]), R = $(current_population[3]), C = $(current_population[4])")
        end
    end

    println("\n===== RESULTADOS FINAIS =====")

    # Number of individuals in each state at the end of the simulation
    final_population = history[end, :]

    println("\n1. População Final (Dia $days_to_simulate):\n")
    println("- Suscetíveis (S): $(final_population[1])")
    println("- Infectados (I): $(final_population[2])")
    println("- Recuperados (R): $(final_population[3])")
    println("- Complicações (C): $(final_population[4])")
    println("- Total: $(sum(final_population))")

    # Percentage of the population that was infected during the period
    total_infected = sum(history[:, 2])
    infected_percentage = (total_infected / (population_total * days_to_simulate)) * 100

    println("\n2. Porcentagem da População Infectada:\n")
    println("- Total que se infectou: $total_infected")
    println("- Porcentagem: $(round(infected_percentage, digits=2))%")

    # Percentage of the population that developed complications
    complications_percentage = (final_population[4] / population_total) * 100

    println("\n3. Porcentagem da População com Complicações:\n")
    println("- Total com complicações: $(final_population[4])")
    println("- Porcentagem: $(round(complications_percentage, digits=2))%")


    println("\n===== ANÁLISE ADICIONAL =====")

    # Peak of the epidemic
    infected_peak = maximum(history[:, 2])
    infected_peak_day = findfirst(x -> x == infected_peak, history[:, 2]) - 1

    println("\nPico da Epidemia:\n")
    println("- Máximo de infectados: $infected_peak")
    println("- Dia do pico: $infected_peak_day")

    # Attack rate (final percentage that is no longer susceptible)
    final_susceptible = final_population[1]
    attack_rate = ((population_total - final_susceptible) / population_total) * 100

    println("\nTaxa de Ataque:\n")
    println("- Suscetíveis restantes: $final_susceptible")
    println("- Taxa de ataque: $(round(attack_rate, digits=2))%")

    println("\n===== SIMULAÇÃO CONCLUÍDA =====")
end