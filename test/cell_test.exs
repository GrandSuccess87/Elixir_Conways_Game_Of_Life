defmodule CellTest do
  use ExUnit.Case
  doctest Cell

  setup do
    %{cell: %Cell{}}
  end

  test "cell_living_status_initialized_false", context do
    assert Cell.get_living(context[:cell]) == false
  end
end

# A location getter
# I want to test that a cell can be added, but first I need a location getter
# A counter to count/track neighboring cells
# Need an "IsAlive" method to loop through the cells and see if there is more than 3
# and see if there is 2 or 3
# Need an "IsDead" method to loop through the cells and see if there are more than 3 cells together
