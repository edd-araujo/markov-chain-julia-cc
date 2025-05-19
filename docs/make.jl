using Documenter, Main

makedocs(
    sitename= "Progressão da Doença",
    modules= [Main],
    format = Documenter.HTML(),
    pages = [
        "Home" => "index.md"
    ],
)