defmodule Cell do
  defstruct location: {},
            living: false

  def get_location(cell) do
    cell.location
  end

  def get_living(cell) do
    cell.living
  end

  # def make_alive(cell) do
  #   %Cell{living: true}
  # end

  def kill(cell) do
     %Cell{living: false}
  end

  def location_to_cell(location) do
    %Cell{location: location}
  end

  def set_living(location) do
    %Cell{living: true, location: location}
  end

end
