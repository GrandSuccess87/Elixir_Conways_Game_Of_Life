defmodule ElixirConwaysGameOfLife do

  # def add_cell_to_world(cell) do
  #   World.add_to_grid(cell)
  # end

  def add_location_to_cell(location) do
    Cell.location_to_cell(location)
  end

  def set_living_at(location) do
    Cell.set_living(location)
  end

  def set_dead_at(location) do
    Cell.set_kill(location)
  end

  # defp tick ([]), do: true
  #recurse through grids
  # defp tick([%World{} | tail]), do: tick(tail)
  # defp tick([_head | _tail]), do: false

    #find neighbors
    #check status of neighbors
    #update_cells based on neighbor status
    #display results
  # end
end
