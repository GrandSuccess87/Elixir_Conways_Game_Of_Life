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

      is_living = World.is_living_cell_at_location(world, [1,5])

      assert is_living == []
    end

    test "it detects a grid space with a living cell" do
      world = World.set_empty

      world = World.add_to_grid(world, %Cell{living: true, location: [1,5]})
      is_living = World.is_living_cell_at_location(world, [1,5])

      assert is_living == [%Cell{living: true, location: [1,5]}]
    end

    test "it detects a grid space with two adjacent living cells" do
      world = World.set_empty

      world_with_origin_cell = World.add_to_grid(world, %Cell{living: true, location: [1,5]})
      world_with_first_adjacent_living_cell = World.add_to_grid(world_with_origin_cell, %Cell{living: true, location: [1,4]})
      world_with_two_adjacent_living_cells = World.add_to_grid(world_with_first_adjacent_living_cell, %Cell{living: true, location: [1,6]})

      assert world_with_two_adjacent_living_cells.grid == [%Cell{living: true, location: [1,5]}, %Cell{living: true, location: [1,4]}, %Cell{living: true, location: [1,6]}]
    end

    test "it detects a grid space with three adjacent living cells" do
      world = World.set_empty

      world_with_origin_cell = World.add_to_grid(world, %Cell{living: true, location: [1,5]})
      world_with_first_adjacent_living_cell = World.add_to_grid(world_with_origin_cell, %Cell{living: true, location: [1,4]})
      world_with_second_adjacent_living_cell = World.add_to_grid(world_with_first_adjacent_living_cell, %Cell{living: true, location: [1,6]})
      world_with_three_adjacent_living_cells = World.add_to_grid(world_with_second_adjacent_living_cell, %Cell{living: true, location: [0,5]})

      assert world_with_three_adjacent_living_cells.grid == [%Cell{living: true, location: [1,5]}, %Cell{living: true, location: [1,4]}, %Cell{living: true, location: [1,6]}, %Cell{living: true, location: [0,5]}]
    end

    test "it detects a live cell with fewer than two adjacent living cells" do
      world = World.set_empty
      origin = [1,1]

      world_with_origin_cell = World.add_to_grid(world, %Cell{living: true, location: origin})
      world_with_first_adjacent_living_cell = World.add_to_grid(world_with_origin_cell, %Cell{living: true, location: [1,2]})
      world_with_first_adjacent_dead_cell = World.add_to_grid(world_with_first_adjacent_living_cell, %Cell{living: false, location: [1,0]})
      # IO.inspect(world_with_first_adjacent_dead_cell.grid)
      # IO.inspect([head | tail] = world_with_first_adjacent_dead_cell.grid)
      # IO.inspect("head: #{inspect(head.location)}")
      # IO.inspect("tail: #{inspect(tail)}")
      is_dead = World.kill_cell(origin)
      # IO.inspect(is_dead)

      assert is_dead == [%Cell{living: false, location: origin}]
    end

    test "detects a live cell with more than three live neighbors and updates its living status to dead" do
      world = World.set_empty
      origin = [1,5]

      world_with_origin_cell = World.add_to_grid(world, %Cell{living: true, location: origin})
      world_with_first_adjacent_living_cell = World.add_to_grid(world_with_origin_cell, %Cell{living: true, location: [1,4]})
      world_with_second_adjacent_living_cell = World.add_to_grid(world_with_first_adjacent_living_cell, %Cell{living: true, location: [1,6]})
      world_with_third_adjacent_living_cells = World.add_to_grid(world_with_second_adjacent_living_cell, %Cell{living: true, location: [0,5]})
      world_with_four_adjacent_living_cells = World.add_to_grid(world_with_third_adjacent_living_cells, %Cell{living: true, location: [0,4]})
      is_dead = World.kill_cell(origin)

      assert is_dead == [%Cell{living: false, location: origin}]
    end

    test "detects a dead cell with exactly three live neighbors and updates its living status to alive" do
      world = World.set_empty
      origin = [1,5]

      world_with_origin_cell = World.add_to_grid(world, %Cell{living: false, location: origin})
      world_with_first_adjacent_living_cell = World.add_to_grid(world_with_origin_cell, %Cell{living: true, location: [1,4]})
      world_with_second_adjacent_living_cell = World.add_to_grid(world_with_first_adjacent_living_cell, %Cell{living: true, location: [1,6]})
      world_with_third_adjacent_living_cells = World.add_to_grid(world_with_second_adjacent_living_cell, %Cell{living: true, location: [0,5]})
      is_alive = World.dead_to_alive(origin)


      assert is_alive == [%Cell{living: true, location: origin}]
    end

    test "finds a cell at the correct location" do
      world = World.set_empty
      location = [1,1]

      world_with_origin_cell = World.add_to_grid(world, %Cell{living: true, location: location})
      cell_found = World.find_cell_at_location_in_world(world_with_origin_cell, location)

      assert cell_found == %Cell{living: true, location: location}
    end

    test "checks if cell at location is living" do
      world = World.set_empty
      location = [1,1]
      world_with_origin_cell = World.add_to_grid(world, %Cell{living: true, location: location})

      assert World.cell_at_location_alive?(world_with_origin_cell, location) == true
    end

    test "checks if cell at location is living in empty location" do
      world = World.set_empty
      location = [1,1]
      world_with_origin_cell = World.add_to_grid(world, %Cell{living: true, location: location})

      assert World.cell_at_location_alive?(world_with_origin_cell, [1,0]) == false
    end

    test "counts if adjacent cells are alive" do
      world = World.set_empty
      origin = [2,3]
      # neighbors = [[2,4], [3,4], [3,3], [3,2], [1,2], [2,2], [1,4], [1,3]]

      world_with_origin_cell = World.add_to_grid(world, %Cell{living: true, location: origin})
      world_with_first_cell = World.add_to_grid(world_with_origin_cell, %Cell{living: true, location: [2,4]})
      world_with_second_cell = World.add_to_grid(world_with_first_cell, %Cell{living: true, location: [3,4]})
      world_with_third_cell = World.add_to_grid(world_with_second_cell, %Cell{living: false, location: [3,3]})
      world_with_fourth_cell = World.add_to_grid(world_with_third_cell, %Cell{living: false, location: [3,2]})
      world_with_fifth_cell = World.add_to_grid(world_with_fourth_cell, %Cell{living: false, location: [1,2]})
      world_with_sixth_cell = World.add_to_grid(world_with_fifth_cell, %Cell{living: false, location: [2,2]})
      world_with_seventh_cell = World.add_to_grid(world_with_sixth_cell, %Cell{living: false, location: [1,4]})
      world_with_eigth_cell = World.add_to_grid(world_with_seventh_cell, %Cell{living: false, location: [1,3]})



      assert World.living_cell_count(world_with_eigth_cell, origin) == 3
    end
end
