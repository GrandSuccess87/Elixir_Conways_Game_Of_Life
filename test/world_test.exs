defmodule WorldTest do
  use ExUnit.Case
  doctest World

  setup do
    %{world: %World{}}
  end

  test "living_cell_has_one_neighbor_in_the_world", context do
    assert World.get_neighbors(context[:world]) == 1
  end

  test "the_world_is_filled_with_cells", context do
    new_world = ElixirConwaysGameOfLife.tic(context[:cell])

    assert new_world == [%Cell{}]
  end
  test "living_cell_has_two_neighbors_in_the_world", context do
    assert World.get_neighbors(context[:world]) == 2
  end

  end
