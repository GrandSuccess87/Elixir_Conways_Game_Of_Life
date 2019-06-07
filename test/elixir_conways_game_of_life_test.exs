defmodule ElixirConwaysGameOfLifeTest do
  use ExUnit.Case
  doctest ElixirConwaysGameOfLife

setup do
  %{world: %World{}, cell: %Cell{}}
end

  test "a new world is empty" do
    new_world = World.set_empty

    assert new_world.empty
  end

  test "a cell can be added to the world" do
    world = World.set_empty
    world_with_one_cell = World.add_to_grid(world, %Cell{})

    assert world_with_one_cell.grid == [%Cell{}]
    refute world_with_one_cell.empty
  end

  test "two cells can be added to the world" do
    world = World.set_empty
    world_with_cell = World.add_to_grid(world, %Cell{})
    world_with_two_cells = World.add_to_grid(world_with_cell, %Cell{})

    assert world_with_two_cells.grid == [%Cell{}, %Cell{}]
    refute world_with_two_cells.empty

  end

  test "two cells with locations can be added to the world" do
    world = World.set_empty
    world_with_cell = World.add_to_grid(world, %Cell{location: [1,0]})
    world_with_two_cells = World.add_to_grid(world_with_cell, %Cell{location: [-10,5]})

    assert world_with_two_cells.grid == [%Cell{location: [1,0]}, %Cell{location: [-10,5]}]
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
