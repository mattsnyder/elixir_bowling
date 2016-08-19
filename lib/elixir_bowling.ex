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

  Or a perfect game
  iex> ElixirBowling.score([10,10,10,10,10,10,10,10,10,10,10,10])
  300
  """
	def score(rolls) do
		Enum.map(rolls, &fill_in_strikes(&1))
		|> List.flatten
		|> fill_empty_frames
		|> Enum.chunk(2) # Divide into frames
		|> Enum.chunk(3,1) # Group frames with potentially related frames
		|> Enum.map(&frame_score(&1))
		|> Enum.sum
	end

	defp frame_score([[10, :strike], next1, next2]), do: score_strike(Enum.filter([10] ++ next1 ++ next2, &is_integer(&1)))
	defp frame_score([[_,:tbd], _, _]), do: 0
	defp frame_score([[roll1, roll2], _, _]) when roll1 + roll2 < 10, do: roll1 + roll2
	defp frame_score([[roll1, roll2], bonus_frame, _]) when roll1 + roll2 == 10, do: frame_score([[:spare],bonus_frame])
	defp frame_score([[:spare], [bonus_roll, _]]) when is_integer(bonus_roll), do: 10 + bonus_roll
	defp frame_score([[:spare], [:tbd, _]]), do: 0

	defp score_strike(rolls) when length(rolls) < 3, do: 0
	defp score_strike(rolls), do: Enum.slice(rolls, 0..3) |> Enum.sum

	defp fill_in_strikes(10), do: [10, :strike]
	defp fill_in_strikes(x), do: x

	defp fill_empty_frames(rolls) when length(rolls) < 22, do: fill_empty_frames(rolls ++ [:tbd]) # Roll to be determined
	defp fill_empty_frames(rolls), do: rolls
end
