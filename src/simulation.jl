using Random

function categorical_draw(probabilities)
    r = rand()
    cumulative = 0.0
    for (i, p) in enumerate(probabilities)
        cumulative += p
        if r <= cumulative
            return i
        end
    end
    return length(probabilities)
end

# Function to simulate the Markov chain progression
function simulate_markov_chain(transition_matrix, num_states, num_iterations, num_entities)
    # Initialize all in state 1
    initial_states = ones(Int, num_entities)
    state_history = zeros(Int, num_entities, num_iterations+1)
    state_history[:, 1] .= initial_states

    for iteration in 1:num_iterations
        for entity in 1:num_entities
            current_state = state_history[entity, iteration]
            probabilities = transition_matrix[current_state, :]
            new_state = categorical_draw(probabilities)
            state_history[entity, iteration+1] = new_state
        end
    end

    # Example output: final distribution of states
    println("\nDistribuição final dos estados após $num_iterations iterações:\n")
    final_states = state_history[:, end]
    for state in 1:num_states
        count = sum(x -> x == state, final_states)
        println("- Estado $state: $count entidade")
    end

    return state_history
end