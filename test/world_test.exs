defmodule WorldTest do
    use ExUnit.Case
    doctest World

    setup do
      %{world: %World{empty: false, grid:
                 [%Cell{living: true, location: [0,0]},
                  %Cell{living: false, location: [0,1]},
                  %Cell{living: false, location: [0,2]},
                  %Cell{living: false, location: [1,0]},
                  %Cell{living: false, location: [1,1]},
                  %Cell{living: false, location: [1,2]},
                  %Cell{living: false, location: [2,0]},
                  %Cell{living: false, location: [2,1]},
                  %Cell{living: false, location: [2,2]}]},
    }
    end

    test "the_world_is_empty" do
      empty_world = World.set_empty

      assert empty_world.empty == true
    end

    test "finds_all_8_neighbors", context do
      initial_cell = %Cell{living: true, location: [1,1]}

      world = context[:world]
      grid = world.grid

      assert World.get_neighbors(world, initial_cell) == grid
    end


    # test "an_empty_world_stays_empty_after_a_tick", context do
    #   new_world = World.set_empty
    #   new_world.tick
    #
    #   assert new_world.empty == false
    # end

  end
