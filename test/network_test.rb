require 'minitest/autorun'
require 'minitest/pride'
require './lib/character'
require './lib/show'
require './lib/network'

class NetworkTest < MiniTest::Test
  def test_it_exists
    nbc = Network.new("NBC")
    assert_instance_of Network, nbc
  end

  def test_it_can_print_name_and_shows
    nbc = Network.new("NBC")
    assert_equal "NBC", nbc.name
    assert_equal [], nbc.shows
  end

  def test_it_can_add_shows
    nbc = Network.new("NBC")
    michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
    knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])
    leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
    ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})
    parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [leslie_knope, ron_swanson])
    nbc.add_show(knight_rider)
    nbc.add_show(parks_and_rec)
    assert_equal [knight_rider, parks_and_rec], nbc.shows
  end

  # def test_it_can_print_main_characters
  #   nbc = Network.new("NBC")
  #   michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
  #   kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
  #   knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])
  #   leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
  #   ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})
  #   parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [leslie_knope, ron_swanson])
  #   nbc.add_show(knight_rider)
  #   nbc.add_show(parks_and_rec)
  #   assert_equal [kitt], nbc.main_characters
  # end

  def test_it_can_give_actors_by_show
      nbc = Network.new("NBC")
      michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
      kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
      knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])
      leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
      ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})
      parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [leslie_knope, ron_swanson])
      nbc.add_show(knight_rider)
      nbc.add_show(parks_and_rec)
      hash = {
        knight_rider => ["David Hasselhoff", "William Daniels"],
        parks_and_rec => ["Amy Poehler", "Nick Offerman"]
      }
      assert_equal hash, nbc.actors_by_show
  end

  def test_it_can_give_shows_by_actor
    nbc = Network.new("NBC")
    michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
    knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])
    leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
    ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})
    parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [leslie_knope, ron_swanson])
    mitch = Character.new({name: "Mitch Buchannon", actor: "David Hasselhoff", salary: 1_200_000})
    baywatch = Show.new("Baywatch", "Gregory Bonann", [mitch])
    nbc.add_show(knight_rider)
    nbc.add_show(parks_and_rec)
    bc.add_show(baywatch)
    hash = {
     "David Hasselhoff" => [knight_rider, baywatch],
     "William Daniels" => [knight_rider],
     "Amy Poehler" => [parks_and_rec],
     "Nick Offerman" => [parks_and_rec]
    }
    assert_equal hash, nbc.shows_by_actor
  end





end
