defmodule World do
  defstruct empty: true,
            grid: [],
            neighbors: 1


def get_grid(world) do
  world.grid
end

def add_to_grid(cell) do
  %World{empty: false, grid: [cell]}
end

def get_neighbors(cell) do
  cell.neighbors
end

end
