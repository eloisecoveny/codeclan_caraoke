class Guest

  attr_reader :name, :fav_song
  attr_accessor :cash

  def initialize(name, fav_song, cash)
    @name = name
    @fav_song = fav_song
    @cash = cash
  end

  def can_afford(entry_fee)
    return @cash >= entry_fee
  end

  def pays_entry_fee(entry_fee)
    @cash -= entry_fee
  end

  def plays_favourite_song(playlist)
    playlist.each do |song|
      return "Woo Hoo!" if song == @fav_song
      return nil
    end
  end

end
