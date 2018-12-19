defmodule Yml.MixProject do
  use Mix.Project

  @description """
    Elixir package for reading/writing yml/yaml files
  """

  def project do
    [
      app: :yml,
      version: "0.0.1",
      elixir: "~> 1.7",
      name: "Yml",
      description: @description,
      source_url: "https://github.com/kortirso/yml",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.19", only: :dev}
    ]
  end

  defp package do
    [
      maintainers: ["Anton Bogdanov"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/kortirso/yml"}
    ]
  end
end
