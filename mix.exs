defmodule JTY.MixProject do
  use Mix.Project

  def project do
    [
      app: :jsontoyaml,
      version: "0.2.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      package: package(),
      deps: deps(),
      description: description(),
      source_url: "https://github.com/mikolaszko/JTY",
      name: "JTY"
    ]
  end

  defp description do
    "Simple, light-weight and dependency free JSON to YAML parser/formatter"
  end

  def deps do
    [
      {:ex_doc, "~> 0.24", only: :dev, runtime: false},
    ] 
  end

  defp package do
    [
      name: "JTY",
      licenses: ["MIT"],
      links: %{"Github" => "https://github.com/mikolaszko/JTY"}
    ]
  end
end
