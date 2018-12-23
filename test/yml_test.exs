defmodule YmlTest do
  use ExUnit.Case

  describe "read from file" do
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

  test "write to string" do
    path_to_read_file = File.cwd! |> Path.join("test/fixtures/en.yml")

    assert {:ok, yml} = Yml.read_from_file(path_to_read_file)

    # success saving to file
    assert {:ok, result} = Yml.write_to_string(yml)

    assert is_binary(result) == true
  end

  test "write to file" do
    path_to_read_file = File.cwd! |> Path.join("test/fixtures/en.yml")
    path_to_write_file = File.cwd! |> Path.join("test/fixtures/result.yml")

    assert {:ok, yml} = Yml.read_from_file(path_to_read_file)

    # success saving to file
    assert {:ok, "File is saved"} = Yml.write_to_file(path_to_write_file, yml)

    # success reading from previous saved file
    assert {:ok, _} = Yml.read_from_file(path_to_write_file)
  end
end
