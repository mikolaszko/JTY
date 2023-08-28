defmodule JTY do
  @moduledoc """
  Simple parser from JSON file to YAML file
  """

  defguardp is_letter(c) when c in ?a..?z or c in ?A..?Z or c == ?_
  defguardp is_digit(c) when c in ?0..?9
  defguardp is_whitespace(c) when c in ~c[ ] 

  def parse(path, dest) do
    open_file_and_trim(path) |> reformat([]) |> create_yaml_file(dest)
  end


  defp reformat(input, tokens) do
    Enum.map(input, 
      fn item -> 
          String.graphemes(item) |> 
          Enum.map(
            fn c ->
              case c do
                ":" -> tokenize(c)
                _ -> c
              end
          end) |>
          IO.puts()
          item
    end)
  end

  defp create_yaml_file(content, dest) do
    File.write!(dest, IO.iodata_to_binary(content))
  end

  defp open_file_and_trim(path) do
    opened_tupled = File.stream!(path, [:raw]) |> Enum.with_index
    Enum.map(
      opened_tupled,
      fn {line, i}-> 
        cond do
           i == 0 -> "---\n" 
           i == length(opened_tupled)-1 -> "\n..."
           true -> String.trim(line) 
            |> String.replace(~s("), "") 
        end
    end)
  end

  defp tokenize(<<":">>), do: "\n"
end
