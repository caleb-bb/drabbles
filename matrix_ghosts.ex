def solution(matrix) do
    solution(matrix, [], 0)
end

def solution([], _, acc) do
    acc
end

def solution([head | tail], flags, acc) do
    new_acc = acc + add_if_not_flagged(head, flags)
    new_flags =
        (flags ++ indices_of_zeros(head)) |> Enum.uniq
    solution(tail, new_flags, new_acc)
end

def add_if_not_flagged(row, []) do
    Enum.sum(row)
end

def add_if_not_flagged(row, flags) do
    IO.inspect(row, label: "ROW")
    IO.inspect(flags, label: "FLAGS")
    row
    |> Stream.with_index()
    |> Stream.reject(fn {_item, index} -> index in flags end)
    |> Enum.map(&elem(&1, 0))
    |> Enum.sum
end

def indices_of_zeros(row) do
    row
    |> Enum.with_index
    |> Enum.filter(&(elem(&1, 0) == 0))
    |> Enum.map(&elem(&1, 1))
end
