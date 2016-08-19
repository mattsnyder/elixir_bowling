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
		pad_rolls(rolls)
	  |> convert_to_frames
		|> Enum.map(&score_frame(&1))
		|> sum
	end

	def score_frame([roll, nil | _ ]), do: 0
	def score_frame([nil | _]), do: 0
	def score_frame([roll1, roll2, roll3, roll4]) when roll1 + roll2 > 9, do: roll1 + roll2 + roll3
	def score_frame([roll1, roll2, roll3, roll4]), do: roll1 + roll2 


	def pad_rolls(rolls) when length(rolls) < 22, do: pad_rolls(rolls ++ [nil])
	def pad_rolls(rolls), do: rolls

	def sum([ total ]), do: total
	def sum([ total | [ head | tail ]]), do: sum([ total + head ] ++ tail)

	def convert_to_frames(rolls) do
		frame = Enum.chunk(rolls, 4, 2)
		IO.inspect frame
		frame
	end
end
