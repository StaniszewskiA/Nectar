defmodule Nectar.TokenExtractor do
  def extract_tokens_from_json(json) do
    case Jason.decode(json) do
      {:ok, parsed_data} ->
        all_tokens = extract_tokens(parsed_data)
        print_tokens(all_tokens)
        save_tokens_to_txt(all_tokens)
      {:error, _} -> IO.puts("Error: Unable to extract the tokens")
    end
  end
  defp extract_tokens(parsed_data) do
    tokens = for sentence <- parsed_data["sentences"] || [], token <- sentence["tokens"] || [] do
      token
    end
    tokens
  end
  defp save_tokens_to_txt(tokens) do
    File.write("tokens.txt", Enum.join(format_tokens(tokens), "\n"))
  end
  defp format_tokens(tokens) do
    Enum.map(tokens, fn(token) ->
      "Token: #{token["form"]}, Lemma: #{token["lemma"]["entry"]}"
    end)
  end
  defp print_tokens(tokens) do
    Enum.each(tokens, fn(token) ->
      IO.puts("Token: #{token["form"]}, Lemma: #{token["lemma"]["entry"]}")
    end)
  end
end
