module Main

using Random, Distributions


states  = ["Saudável", "Doente", "Recuperado", "Óbito", :string]

transitions = Dict(
	"Saudável" => (["Saudável", "Doente"], [0.85, 0.15]),
	"Doente" => (["Doente", "Recuperado", "Óbito"], [0.65, 0.25, 0.10]),
	"Recuperado" => (["Saudável", "Doente", "Recuperado"], [0.90, 0.05, 0.05]),
	"Óbito" => (["Óbito"], [1.0]),
)

function transition(actualState::String, transitions::Dict)
	nextState, probs = transitions[actualState]
	return sample(nextState, Weights(probs))
end
end
