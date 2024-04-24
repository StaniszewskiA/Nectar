defmodule Nectar.BatchProcessor do
  def process_data(folder_paths) do
    Enum.each(folder_paths, &Nectar.TokenExtractor.extract_tokens_from_json/1)
  end
end
