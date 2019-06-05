defmodule World do
  defstruct empty: true,
            grid: [],
            alive_neighbors: 0


def get_grid(world) do
  world.grid
end

def set_empty do
  %World{empty: true}
end

def add_to_grid(cell) do
  %World{empty: false, grid: [cell]}
end

def get_neighbors(world, cell) do
  get_grid(world)
  |> get_neighbors(cell, [])
end

def get_neighbors([head | tail], cell, acc) do
  cell_location = cell.location
  head_location = head.location

  Enum.map(head_location, fn num -> 
      Enum.member?(cell_location[0], num)
    )

  if head.location == location ||
  #   acc += head

  get_neighbors(tail, cell, acc)
end

def get_neighbors([], _cell, acc) do
  acc
end

end
