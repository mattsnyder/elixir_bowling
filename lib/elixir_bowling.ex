defmodule ElixirBowling do

	@doc """
  Scores a game of bowling

  ## Examples
  Scoring a game with only the first frame completed
  iex> ElixirBowling.score([5,4])
  9

  Or scoring a game in progress with an incomplete frame
  iex> ElixirBowling.score([5,4,6])
  9
  """
	def score([]), do: 0
	def score([roll]), do: 0
  def score(rolls) do 
	  convert_to_frames(rolls)
		|> Enum.map(&sum(&1))
		|> sum
	end

	def sum([ total ]), do: total
	def sum([ total | [ head | tail ]]), do: sum([ total + head ] ++ tail)

	def convert_to_frames(rolls) do
		Enum.chunk(rolls, 2)
	end
end
