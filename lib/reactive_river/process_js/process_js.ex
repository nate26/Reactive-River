defmodule ReactiveRiver.ProcessJs do
  @moduledoc """
  This module is responsible for processing and running js files.
  """

  defp run_js(code) do
    # Implement code execution logic here
    # For example, run the code in a Docker container
    IO.puts("Running JS code")
    IO.puts("------------------------------------------------")
    {result, _idx} = System.cmd("node", ["--eval", code])
    result
  end

  def clean_string(string) do
    String.replace(string, ~r/\n/, "").replace(~r/\r/, "")
  end

  def validate_code(code, {expected_result, _idx}) do
    result = run_js(code)

    clean_result = clean_string(result)
    clean_expected_result = clean_string(expected_result)

    IO.puts("------------------------------------------------")
    IO.puts("[" <> clean_result <> "]")
    IO.puts("------------------------------------------------")
    IO.puts("------------------------------------------------")
    IO.puts("[" <> clean_expected_result <> "]")
    IO.puts("------------------------------------------------")

    if clean_result == clean_expected_result do
      {:ok, clean_result}
    else
      {:error, clean_result}
    end
  end
end
