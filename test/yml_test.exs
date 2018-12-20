defmodule YmlTest do
  use ExUnit.Case

  describe "read file" do
    test "returns error for unexisted file" do
      path_to_file = File.cwd! |> Path.join("test/fixtures/something.yml")

      assert {:error, "File reading error"} = Yml.read_from_file(path_to_file)
    end

    test "returns error for not YML file" do
      path_to_file = File.cwd! |> Path.join("test/fixtures/strings.xml")

      assert {:error, "YML structure error"} = Yml.read_from_file(path_to_file)
    end

    test "returns map for existed file" do
      path_to_file = File.cwd! |> Path.join("test/fixtures/en.yml")

      assert {:ok, %{}} = Yml.read_from_file(path_to_file)
    end
  end
end
