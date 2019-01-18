class Guest

  attr_reader :name, :fav_song
  attr_accessor :cash

  def initialize(name, fav_song, cash)
    @name = name
    @fav_song = fav_song
    @cash = cash
  end

  def can_afford(entry_fee)
    return true if @cash >= entry_fee
    return false
  end

  def pays_entry_fee(entry_fee)
    @cash -= entry_fee
  end

end
