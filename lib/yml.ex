defmodule Yml do
  @moduledoc """
  Module for reading/writing yml/yaml files
  """

  @doc """
  Read YML file to map

  ## Parameters

    - path_to_file: path to file for locale detection

  ## Examples

      iex> Yml.read_from_file("/path_to_file")
      {:ok, %{}}

      iex> Yml.read_from_file("/path_to_unexisted_file")
      {:error, "File reading error"}

  """
  @spec read_from_file(String.t()) :: {:ok, %{}}

  def read_from_file(path_to_file) when is_binary(path_to_file) do
    case YamlElixir.read_from_file(path_to_file) do
      {:ok, %{} = yml} -> {:ok, yml}
      {:ok, _} -> {:error, "YML structure error"}
      _ -> {:error, "File reading error"}
    end
  end

  @doc """
  Write map to YML file

  ## Parameters

    - path_to_file: path to file for locale detection
    - content: content represented as map

  ## Examples

      iex> Yml.write_to_file("/path_to_file", %{something => %{Hello: "Hello"}})
      {:ok, "File is saved"}

  """
  @spec write_to_file(String.t(), %{}) :: {:ok, %{}}

  def write_to_file(path_to_file, content) when is_binary(path_to_file) and is_map(content) do
    content = do_content_transform("", content, 0)
    case File.write(path_to_file, content) do
      :ok -> {:ok, "File is saved"}
      _ -> {:error, "File writing error"}
    end
  end

  defp do_content_transform(acc, %{} = content, layer_index) do
    Enum.reduce(content, acc, fn {key, value}, acc ->
      cond do
        is_map(value) ->
          acc
          |> attach_content(layer_index, key)
          |> do_content_transform(value, layer_index + 1)

        true ->
          attach_content(acc, layer_index, key, value)
      end
    end)
  end

  defp attach_content(acc, layer_index, key), do: acc <> "#{add_head_spaces(layer_index, 0, "")}#{key}:\n"
  defp attach_content(acc, layer_index, key, value), do: acc <> "#{add_head_spaces(layer_index, 0, "")}#{key}: #{value}\n"

  defp add_head_spaces(layer_index, index, acc) when layer_index > index, do: add_head_spaces(layer_index, index + 1, acc <> "  ")
  defp add_head_spaces(_, _, acc), do: acc
end
