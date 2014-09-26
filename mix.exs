defmodule Cor.Mixfile do
  use Mix.Project

  def project do
    [app: :cor,
     version: "0.0.1",
     elixir: "~> 0.15.1",
     deps: deps]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [
      {:hexate,  ">= 0.5.0", [github: "suranyami/hexate"]},
    ]
  end
end
