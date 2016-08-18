defmodule ElixirBowlingTest do
  use ExUnit.Case
  doctest ElixirBowling

  test "the truth" do
    assert 1 + 1 == 2
  end

	test "a fresh game" do
		assert ElixirBowling.score([]) == 0
	end

	test "an incomplete frame" do
		assert ElixirBowling.score([5]) == 0
	end

	test "2 rolls (a single complete frame)" do
		assert ElixirBowling.score([5,1]) == 6
	end

	test "two complete frames" do
		assert ElixirBowling.score([3,5,6,1]) == 15
	end

	test "a spare with an extra roll" do
		assert ElixirBowling.score([5,5,3]) == 13
	end



end
