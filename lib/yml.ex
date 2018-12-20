defmodule Yml do
  @moduledoc """
  Module for reading/writing yml/yaml files
  """

  @doc """
  Read YML file to map

  ## Parameters

    - file: path to file for locale detection

  ## Examples

      iex> Yml.read_from_file("/path_to_file")
      {:ok, %{}}

      iex> Yml.read_from_file("/path_to_unexisted_file")
      {:error, "File reading error"}

  """
  @spec read_from_file(String.t()) :: {:ok, %{}}

  def read_from_file(path_to_file) do
    case YamlElixir.read_from_file(path_to_file) do
      {:ok, %{} = yml} -> {:ok, yml}
      {:ok, _} -> {:error, "YML structure error"}
      _ -> {:error, "File reading error"}
    end
  end
end
