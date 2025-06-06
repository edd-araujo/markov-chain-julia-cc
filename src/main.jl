
using LinearAlgebra
using Printf

function run_disease_model()
	println("\nExecutando simulação com parâmetros pré-definidos.\n")
	println("=" ^ 50)
	println("        MODELO DE PROGRESSÃO DE DOENÇA")
	println("=" ^ 50)
	println("\nDoença escolhida: Gripe/Influenza\n")

	simulate_influenza_progression()

	println("\nRetornando para o menu principal...\n")
end

function execute_generic_model()
	println("\nExecutando simulação com parâmetros personalizados.\n")
	println("=" ^ 50)
	println("           MODELO PERSONALIZADO")
	println("=" ^ 50)

	# Configure the transition matrix with user input
	transition_matrix, num_states = configure_transition_matrix()

	println("\n===== Configurando parametros da simulação =====\n")
	print("Número de iterações: ")
	num_iterations = parse(Int, readline())

	print("Número de entidades para simular: ")
	num_entities = parse(Int, readline())

	# Execute simulation with the personalized matrix
	state_history = simulate_markov_chain(transition_matrix, num_states, num_iterations, num_entities)

	println("\n===== SIMULAÇÃO CONCLUÍDA =====")
	println("\nRetornando para o menu principal...\n")

	return state_history
end

# Main menu function
function main()
	println("=" ^ 50)
	println("        SIMULADOR DE CADEIA DE MARKOV")
	println("=" ^ 50)
	println()
	println("Selecione uma das opções abaixo:\n")
	println("1 - Modelo de Progressão de Doença")
	println("2 - Modelo Personalizado (NxN)")
	println("0 - Sair")
	println()

	while true
		print("Selecione uma das opções (1, 2 ou 0): ")
		choice = strip(readline())

		if choice == "1"
			try
				run_disease_model()
			catch e
				println("Erro ao executar o modelo de doença: $e")
				println("Verifique se todas as funções estão implementadas corretamente.")
			end

		elseif choice == "2"
			try
				execute_generic_model()
			catch e
				println("Erro ao executar o modelo de doença: $e")
				println("Verifique se todas as funções estão implementadas corretamente.")
			end

		elseif choice == "0"
			println("Encerrando...")
			break

		else
			println("Opção inválida! Por favor, digite 0, 1, or 2.\n")
		end
	end
end

# Execute the program
if abspath(PROGRAM_FILE) == @__FILE__
	main()
end



