defmodule World do
  defstruct empty: true,
            grid: [],
            alive_neighbors: 0

  def set_empty do
    %World{empty: true}
  end

  def add_to_grid(world, cell) do
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

  def is_living_cell_at_location(world, [x,y]) do
    world = world.grid
    Enum.filter(world, fn cell -> cell.living == true end)
  end

  def kill_cell(location) do
    [%Cell{living: false, location: location}]
  end

  def dead_to_alive(location) do
    [%Cell{living: true, location: location}]
  end

end
