defmodule ElixirConwaysGameOfLifeTest do
  use ExUnit.Case
  doctest ElixirConwaysGameOfLife

setup do
  %{world: %World{}, cell: %Cell{}}
end

  test "a_cell_can_be_added_to_the_world", context do
    new_world = ElixirConwaysGameOfLife.add_cell_to_world(context[:cell])

    assert new_world.grid == [%Cell{}]
  end

  test "after_adding_a_cell_the_world_is_not_empty", context do
    new_world = ElixirConwaysGameOfLife.add_cell_to_world(context[:cell])

    assert new_world.grid == [%Cell{}]
    assert new_world.empty == false
  end

  test "a_location_can_be_added_to_a_cell", context do
    location = {0,0}
    new_cell = ElixirConwaysGameOfLife.add_location_to_cell(location)

    assert new_cell.location == {0,0}
  end

  test "a_cell_is_alive_at_the_location_added_to_a_cell", context do
    location = {0,0}
    new_cell = ElixirConwaysGameOfLife.set_living_at(location)

    assert new_cell.location == {0,0}
    assert new_cell.living == true
  end

  test "a_cell_is_not_alive_at_the_location_added_to_a_cell", context do
    location = {1,1}
    new_cell = ElixirConwaysGameOfLife.set_dead_at(location)
    assert new_cell.location == {1,1}
    assert new_cell.living == false
  end
  
end

# A location getter
# I want to test that a cell can be added, but first I need a location getter
# A counter to count/track neighboring cells
# Need an "IsAlive" method to loop through the cells and see if there is more than 3
# and see if there is 2 or 3
# Need an "IsDead" method to loop through the cells and see if there are more than 3 cells together
