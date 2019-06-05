defmodule ElixirConwaysGameOfLife do

  def world_is_empty do
    %World{empty: true}
  end

  def add_cell_to_world(cell) do
    World.add_to_grid(cell)
  end

  def add_location_to_cell(location) do
    Cell.location_to_cell(location)
  end

  def set_living_at(cell) do
    Cell.set_living(cell)
  end

  # defp tick ([]), do: true
  # #recurse through grids
  # defp tick([%World{} | tail]), do: tick(tail)
  # defp tick([_head | _tail]), do: false

    #find neighbors
    #check status of neighbors
    #update_cells based on neighbor status
    #display results
  # end
end
