# Yml

Elixir package for reading/writing yml/yaml files.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `yml` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:yml, "~> 0.9.1"}
  ]
end
```

## Using

### Read from YML file

Read from YML/YAML file

```elixir
  Yml.read_from_file("/path_to_file")
```

### Write to string

Read from YML/YAML file

```elixir
  Yml.write_to_string(content)
```

### Write to YML file

Read from YML/YAML file

```elixir
  Yml.write_to_file("/path_to_file", content)
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kortirso/yml.

## License

The package is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Disclaimer

Use this package at your own peril and risk.

## Documentation

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/learn_kit](https://hexdocs.pm/learn_kit).

