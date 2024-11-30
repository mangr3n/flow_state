defmodule FlowState.MixProject do
  use Mix.Project

  def project do
    [
      app: :flow_state,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: "A framework for building AI-powered workflows in Elixir",
      package: package(),
      name: "FlowState",
      source_url: "https://github.com/yourusername/flow_state"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {FlowState.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:jason, "~> 1.4"},  # JSON encoding/decoding
      {:tesla, "~> 1.7"},  # HTTP client for API interactions
      {:ex_doc, "~> 0.29", only: :dev, runtime: false},  # Documentation generator
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},  # Static code analysis
      {:dialyxir, "~> 1.3", only: [:dev], runtime: false},  # Static type checking
      {:typed_struct, "~> 0.3.0"},  # Type specifications for structs
      {:telemetry, "~> 1.2"}  # Metrics and instrumentation
    ]
  end

  defp package do
    [
      name: "flow_state",
      files: ~w(lib .formatter.exs mix.exs README* LICENSE*),
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/yourusername/flow_state"}
    ]
  end
end
