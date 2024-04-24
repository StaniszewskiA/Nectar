defmodule NectarTest do
  use ExUnit.Case
  doctest Nectar

  test "greets the world" do
    assert Nectar.hello() == :world
  end

  test "replaces vulgar characters with Greek counterparts" do
    input = "i/t se/ems to/ be/ w/o/rki/ng a/s e/xpec/te/d"
    expected_output = "ἰt sἐems tό bἐ ὠόrkἰng άs ἐxpec/tἐd"

    assert Nectar.Greekifier.devulgarize(input) == expected_output
  end
end
