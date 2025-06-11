function get_number_of_states()
  while true
      try
          print("Insira o número de estados (N) para a matriz NxN: ")
          num_states = parse(Int, readline())
          if num_states > 0
              return num_states
          else
              println("Por favor, digite um número positivo.")
          end
      catch
          println("Entrada inválida. Digite um número inteiro.")
      end
  end
end

# Function to get a valid probability
function get_probability(state_number, transition_number, current_sum=0.0)
  while true
      try
          print("Probabilidade de transição do estado $state_number para o estado $transition_number: ")
          probability = parse(Float64, readline())
          if probability >= 0.0 && probability <= 1.0 && (current_sum + probability) <= 1.0
              return probability
          else
              println("Probabilidade inválida. Deve estar entre 0 e $(1.0 - current_sum)")
          end
      catch
          println("Entrada inválida. Digite um número decimal.")
      end
  end
end

# Function to configure the transition matrix with user input
function configure_transition_matrix()
  println("\n===== CONFIGURAÇÃO DA MATRIZ DE TRANSIÇÃO =====\n")

  # Get the number of states
  num_states = get_number_of_states()

  # Initialize the transition matrix
  transition_matrix = zeros(Float64, num_states, num_states)

  println("\nDigite as probabilidades de transição para cada estado.\n")
  println("Cada linha deve somar 1.0 (100%).")

  # Fill the matrix row by row
  for i in 1:num_states
      println("\n- Estado $i:\n")
      row_sum = 0.0
      for j in 1:num_states
          if j < num_states
              # Get the transition probability
              probability = get_probability(i, j, row_sum)
              transition_matrix[i, j] = probability
              row_sum += probability
          else
              # Automatically complete the last column to add 1
              transition_matrix[i, j] = round(1.0 - row_sum, digits=5)
              println("Probabilidade de transição do estado $i para o estado $j: $(transition_matrix[i, j]) (completando 1.0)")
          end
      end
  end

  println("\nMatriz de transição definida:\n")
  for i in 1:num_states
      println(transition_matrix[i, :])
  end

  return transition_matrix, num_states
end