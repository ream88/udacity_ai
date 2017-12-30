defmodule UdacityAi do
  @coin [:H, :T]
  @coins for a <- @coin,
             b <- @coin,
             c <- @coin,
             do: [a, b, c]

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

  @dice 1..6
  @dices for a <- @dice,
             b <- @dice,
             do: [a, b]

  @doc """
  What is the probability that the PRODUCT of rolling two six-sided dice with
  values 1-6 on the faces will be ODD?

  iex> UdacityAi.question_4
  0.25
  """
  require Integer

  def question_4 do
    dices_probability(fn [a, b] -> Integer.is_odd(a * b) end)
  end

  @doc """
  Suppose that we randomly generate numbers by rolling two six-sided dice with
  values 1-6 on the faces and take the sum of the values.
  (e.g., (1, 1) = 1 + 1 = 2, (5, 2) = 5 + 2 = 7, (2, 4) = 2 + 4 = 6, etc.)
  What is the probability of generating the number 7?

  iex> UdacityAi.question_5
  0.16666666666666666
  """
  def question_5 do
    dices_probability(fn dices -> Enum.sum(dices) == 7 end)
  end

  @doc """
  Suppose that we randomly generate numbers by rolling two six-sided dice with
  values 1-6 on the faces taking the value of the first dice multiplied by 2,
  then subtract 1 if the number on the second dice is odd or subtract 0 if the
  number on the second dice is even.
  (e.g., (4, 1): 2 * 4 - 1 = 7, (4, 3): 2 * 4 - 1 = 7, (4, 5): 2 * 4 - 1 = 7,
  (3, 6): 2 * 3 - 0 = 6, etc.)
  What is the probability of generating the number 3?

  iex> UdacityAi.question_6
  0.08333333333333333
  """
  def question_6 do
    dices_probability(fn [a, b] ->
      case Integer.is_odd(b) do
        true -> a * 2 - 1
        false -> a * 2
      end == 3
    end)
  end

  defp dices_probability(fun) do
    Enum.count(@dices, fun) / Enum.count(@dices)
  end
end
