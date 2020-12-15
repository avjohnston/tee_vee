class Network
  attr_reader :name,
              :shows

  def initialize(name)
    @name = name
    @shows = []
  end

  def add_show(show)
    @shows << show
  end

  # def main_characters
  #   @shows.map do |show|
  #     show.characters.find_all do |actor|
  #       characters.salary > 500_000
  #     end
  #   end
  # end

  def actors_by_show
    by_show = {}
    @shows.each do |show|
      by_show[show] = show.actors
    end
    by_show
  end

  def shows_by_actor
    by_actor = {}
    @shows.each do |show|
      by_actor[show.characters.actor] = show
    end
    by_actor
  end

end
