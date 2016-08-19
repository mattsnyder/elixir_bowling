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

	test "a spare without the next roll" do
		assert ElixirBowling.score([1,6,3,7]) == 7
	end

	test "a scoreable strike" do
		assert ElixirBowling.score([10,3,4]) == 24
	end

	test "an unscoreable strike" do
		assert ElixirBowling.score([3,6,10,2]) == 9
	end

end
