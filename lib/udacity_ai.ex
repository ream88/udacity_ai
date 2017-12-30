defmodule UdacityAi do
  @coin [:H, :T]
  @coins for c1 <- @coin,
             c2 <- @coin,
             c3 <- @coin,
             do: [c1, c2, c3]

  @doc """
  The probability of flipping a fair coin (i.e., p(Heads)=0.5) three times and
  observing the EXACT sequence {Heads, Heads, Tails} is:

  iex> UdacityAi.question_1
  0.125
  """
  def question_1 do
    coins_probability(fn coins -> coins == [:H, :H, :T] end)
  end

  @doc """
  The probability of flipping a fair coin (i.e., p(Heads)=0.5) three times and
  observing AT LEAST two Heads is:

  iex> UdacityAi.question_2
  0.5
  """
  def question_2 do
    coins_probability(fn coins ->
      Enum.count(coins, fn coin -> coin == :H end) >= 2
    end)
  end

  @doc """
  The probability of flipping a fair coin (i.e., p(Heads)=0.5) three times and
  observing EXACTLY two Heads and one Tails is:

  iex> UdacityAi.question_3
  0.375
  """
  def question_3 do
    coins_probability(fn coins ->
      Enum.count(coins, fn coin -> coin == :H end) == 2
    end)
  end

  defp coins_probability(fun) do
    Enum.count(@coins, fun) / Enum.count(@coins)
  end
end
