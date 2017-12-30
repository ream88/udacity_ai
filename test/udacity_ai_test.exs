defmodule UdacityAiTest do
  use ExUnit.Case
  doctest UdacityAi

  test "greets the world" do
    assert UdacityAi.hello() == :world
  end
end
