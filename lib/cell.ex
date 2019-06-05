defmodule Cell do
  defstruct location: [],
            living: false

  def get_location(cell) do
    cell.location
  end

  def get_living(cell) do
    cell.living
  end

  def location_to_cell(location) do
    %Cell{location: location}
  end

  def set_living(location) do
    %Cell{living: true, location: location}
  end

  def set_kill(location) do
    %Cell{living: false, location: location}
  end

end
