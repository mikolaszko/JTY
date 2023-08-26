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
  def parse(path) do
    open_file_and_trim(path)
  end

  defp open_file_and_trim(path) do
    opened_tupled = File.stream!(path) |> Enum.with_index
    trimmed = Enum.map(
      opened_tupled,
      fn {line, i}-> 
        cond do
           i == 0 -> nil
           i == length(opened_tupled)-1 -> nil
           true -> String.trim(line)
        end

    end) 
    IO.inspect(trimmed)
    trimmed
  end
end
