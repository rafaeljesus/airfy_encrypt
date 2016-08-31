defmodule AirfyEncrypt.Mixfile do
  use Mix.Project

  def project do
    [app: :airfy_encrypt,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [applications: [:logger, :maru], mod: {AirfyEncrypt, []}]
  end

  defp deps do
    [{:maru, "~> 0.10.4"},
      {:poison, "~> 2.0", override: true},
      {:cors_plug, "~> 1.1"},
      {:joken, "~> 1.1"},
      {:rsa_ex, "~> 0.1"}]
  end
end
