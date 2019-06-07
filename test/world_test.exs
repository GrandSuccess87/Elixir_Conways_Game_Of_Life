defmodule WorldTest do
    use ExUnit.Case

    test "it returns no neighbors for an empty board" do
      world = World.set_empty

      neighbors = World.get_neighbors(world, %Cell{location: [1,5]})

      assert neighbors == []
    end

    test "it returns no neighbors if two cells are not adjacent to each other" do
      world = World.set_empty
      one_cell = World.add_to_grid(world, %Cell{living: true, location: [1,2]})

      neighbors = World.get_neighbors(one_cell, %Cell{location: [1,5]})

      assert neighbors == []
    end

    test "it gets the eight adjacent grid points next to [0,0]" do
      origin = [0,0]
      neighbors = [[0,1], [1,1], [1,0], [1,-1], [-1,-1], [0,-1], [-1,1], [-1,0]]
      assert World.adjacent_cells(origin) == neighbors
    end

    test "it gets the eight adjacent grid points next to [2,3]" do
      origin = [2,3]
      neighbors = [[2,4], [3,4], [3,3], [3,2], [1,2], [2,2], [1,4], [1,3]]
      assert World.adjacent_cells(origin) == neighbors
    end

    test "it detects a grid space with no living cell" do
      world = World.set_empty
    #
      is_living = World.is_living_cell_at_location(world, [1,5])
    #
    #   refute is_living
    end

    # test "it detects a grid space with a living cell" do
    #   world = World.set_empty
    #   world = World.add_to_grid(world, %Cell{living: true, location: [1,5]})
    #
    #   is_living = World.is_living_cell_at_location(world, [1,5])
    #
    #   assert is_living
    # end
end
