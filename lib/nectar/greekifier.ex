defmodule Nectar.Greekifier do
  def count_vowels(string) do
    missprinted_regex = ~r/[aeiouAEIOU](?=[^\s\w])/
    missprinted_vowels = Regex.scan(missprinted_regex, string)
    missprinted_count = Enum.count(missprinted_vowels)
    IO.puts(missprinted_count)
  end
  def devulgarize(string) do
    vulgar_to_greek = %{
      # Accutus
      "a/" => "ά",
      "e/" => "ἐ",
      "n/" => "ἠ",
      "i/" => "ἰ",
      "u/" => "ὐ",
      "w/" => "ὠ",
      "o/" => "ό"
      # TODO
      # Gravis - unfortunately it's denoted by backslash in the dataset, need to find a way around it
      # Circumflexus
      # Soft breathing
      # Soft breathing + Accutus
      # Soft breathing + Circumflexus
      # Soft breathing + Gravis
      # Rough breathing
      # Rough breathing + Accutus
      # Rough breathing + Circumflexus
      # Rough breathing + Gravis
      # Coronis
      # Diaeresis
    }
    devulgarized =
      Enum.reduce(vulgar_to_greek, string, fn {vulgar, greek}, acc ->
        Regex.replace(~r/#{vulgar}/, acc, greek, global: true)
      end)

    devulgarized
  end
end
