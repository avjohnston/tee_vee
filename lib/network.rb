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

  def main_characters
    @shows.map do |show|
      show.characters.find_all do |character|
        character.salary > 500_000 && character.name == character.name.upcase
      end.flatten
    end
  end

  def actors_by_show
    by_show = {}
    @shows.each do |show|
      by_show[show] = show.actors
    end
    by_show
  end

  def shows_by_actor
    all_actors = shows.map do |show|
      show.characters.map do |character|
        character.actor
      end
    end.flatten.uniq

    shows_hash = {}
    all_actors.each do |actor|
      shows_hash[actor] = shows
    end
    shows_hash
  end

end
