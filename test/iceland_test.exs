defmodule IcelandTest do
  use ExUnit.Case
  doctest Iceland

  test "greets the world" do
    assert Iceland.hello() == :world
  end
end
