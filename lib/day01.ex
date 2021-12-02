defmodule Day01 do
  @sample ~w/199
             200
             208
             210
             200
             207
             240
             269
             260
             263/
             |> Enum.map(&String.to_integer/1)

  @report_list "assets/day01.txt"
               |> File.read!()
               |> String.split(~r/\n/, trim: true)
               |> Enum.map(&String.to_integer/1)

  def list do
    @report_list
  end

  defp larger_than_previous([]), do: []

  defp larger_than_previous([h1 | [h2 | _] = t]) do
    [h2 > h1 | larger_than_previous(t)]
  end

  defp larger_than_previous([_ | t]), do: larger_than_previous(t)

  def count do
    ltp_count(list())
  end

  def count_sample do
    ltp_count(@sample)
  end

  # Puzzle 2

  defp sum3([]), do: []

  defp sum3([h1 | [h2 | [h3 | _]] = t]) do
    [h1 + h2 + h3 | sum3(t)]
  end

  defp sum3([_ | t]), do: sum3(t)

  def count2_sample do
    sum3 = sum3(@sample)
    ltp_count(sum3)
  end

  def count2 do
    sum3 = sum3(@report_list)
    ltp_count(sum3)
  end

  defp ltp_count(list) do
    list_ltp = larger_than_previous(list)
    Enum.count(list_ltp, fn x -> x == true end)
  end
end

# Results of the Sample
IO.puts("The result of the 1st sample is: #{Day01.count_sample()}")
IO.puts("The result of the 2nd sample is: #{Day01.count2_sample()}")

# Results of the Puzzle
IO.puts("The result of the 1st puzzle is: #{Day01.count()}")
IO.puts("The result of the 2nd puzzle is: #{Day01.count2()}")
