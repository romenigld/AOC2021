defmodule Day02 do
  @sample """
          forward 5
          down 5
          forward 8
          up 3
          down 8
          forward 2
          """
          |> String.trim()
          |> String.split(~r/\n/, trim: true)

  @day02_file "assets/day02.txt"

  def parse do
    @day02_file
    |> File.read!()
    |> String.split(~r/\n/, trim: true)
  end

  def sample_main do
    @sample
    |> split_str_by_2()
    |> parse_str_to_int()
    |> take_horizontalp_and_depth()
  end

  def main do
    parse()
    |> split_str_by_2()
    |> parse_str_to_int()
    |> take_horizontalp_and_depth()
  end

  def split_str_by_2(list) do
    list
    |> Enum.map(&(String.split(&1, " ")))
  end

  def parse_str_to_int([]), do: []
  def parse_str_to_int([[x, y] | t]) do
    [ {x, String.to_integer(y)} | parse_str_to_int(t)]
  end

  def take_horizontalp_and_depth(list) do
    {h, d} =
            list
            |> Enum.reduce({_h = 0, _d = 0}, fn
              {"forward", n}, {h, d} -> {h + n, d}
              {"down", n}, {h, d} -> {h, d + n}
              {"up", n}, {h, d} -> {h, d - n}
            end)

    h * d
  end

  # Part 2

  def sample_main2 do
    @sample
    |> split_str_by_2()
    |> parse_str_to_int()
    |> take_horizontalp_and_depth2()
  end

  def main2 do
    parse()
    |> split_str_by_2()
    |> parse_str_to_int()
    |> take_horizontalp_and_depth2()
  end

  def take_horizontalp_and_depth2(list) do
    {h, d, _a} =
            list
            |> Enum.reduce({0, 0, 0}, fn
              {"forward",  n}, {h, d, a} -> {h + n, d + (a * n), a}

              {"down", n}, {h, d, a} -> {h, d, a + n}

              {"up", n}, {h, d, a} -> {h, d, a - n}
            end)

    h * d
  end
end
