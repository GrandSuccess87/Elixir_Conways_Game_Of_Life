defmodule ElixirConwaysGameOfLife.MixProject do
  use Mix.Project

  def project do
    [
      app: :elixir_conways_game_of_life,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  # def application do
  #   [
  #     # mod: {elixir_conways_game_of_life, []},
  #     extra_applications: [:file_system, :logger]
  #   ]
  # end

  # Run "mix help deps" to learn about dependencies.
  # defp deps do
  #   [
  #         {:file_system, "~> 0.2"}
  #
  #     # {:dep_from_hexpm, "~> 0.3.0"},
  #     # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #   ]
  # end

  def deps do
  [
    {:mix_test_watch, "~> 0.8", only: :dev, runtime: false},
    {:elixir_conways_game_of_life, "~> 0.1.0"}
  ]
  end

end
