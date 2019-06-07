defmodule World do
  defstruct empty: true,
            grid: [],
            alive_neighbors: 0

def set_empty do
  %World{empty: true}
end

def add_to_grid(world, cell) do
  # IO.inspect(world)
  %World{empty: false, grid: (world.grid ++ [cell])}
end

def get_neighbors(world, cell) do
  # get the cell's location
  # calculate the eight neighbors around that location
  # figure out which of those 8 are acutally alive
  # return an array of the locations of the alive cells
  []
end

def adjacent_cells([x,y]) do
  [[x,y+1], [x+1,y+1], [x+1,y], [x+1,y-1], [x-1,y-1], [x,y-1], [x-1,y+1], [x-1,y]]
end

# def is_living_cell_at_location(world, [x,y]) do
#   false
# end

def is_living_cell_at_location(world, [x,y]) do
  world = world.grid
  
  # IO.inspect(world)

#   # Enum.map(world, fn [cell] -> [cell.living == true] end)
Enum.filter(world, fn cell -> cell.living == true end)


#   # cond do
#   #   [cell.living == true] -> [cell.location]
#   # end
#
end

# def get_grid_of_world(grid, cell, acc) do
#   cell_location = cell.location
#   head_location = head.location
#
#   Enum.map(head_location, fn num ->
#       Enum.member?(cell_location[0], num)
#     end)
# end

end
