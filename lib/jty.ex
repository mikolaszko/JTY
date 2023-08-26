defmodule JTY do
  @moduledoc """
  Simple parser from JSON file to YAML file
  """

  @doc """
  ## Examples
      iex> JTY.parse(path)
      :ok || :error

      if :ok then yaml file gets generated
  """
  def parse(path, dest) do
    open_file_and_trim(path) |> create_yaml_file(dest)
    
     
  end

  defp create_yaml_file(content, dest) do
    IO.inspect(dest)
    IO.inspect(content)

    File.write!(dest, IO.iodata_to_binary(content))
  end

  defp open_file_and_trim(path) do
    opened_tupled = File.stream!(path, [:raw]) |> Enum.with_index
    Enum.map(
      opened_tupled,
      fn {line, i}-> 
        cond do
           i == 0 -> "start" 
           i == length(opened_tupled)-1 -> "end"
           true -> String.trim(line) 
            |> String.replace(~s("), "") 
        end
    end)
  end
end
