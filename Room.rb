class Room

  attr_reader :capacity, :playlist, :guests, :entry_fee
  attr_accessor :kitty

  def initialize(capacity, playlist, guests)
    @capacity = capacity
    @playlist = playlist
    @guests = guests
    @entry_fee = 10
    @kitty = 0
  end

  def add_guest(guest_to_add)
    @guests << guest_to_add
  end

  def remove_guest(guest_to_remove)
    @guests.each { |guest| @guests.delete(guest_to_remove) }
  end

  def free_space()
    number_of_guests = @guests.length()
    return number_of_guests < @capacity
  end

  def takes_entry_fee_from_guest(guest)
     guest.pays_entry_fee(@entry_fee)
     return @entry_fee
  end

  def check_in_guest(new_guest)
    if free_space() && new_guest.can_afford(@entry_fee)
      add_guest(new_guest)
      new_guest.pays_entry_fee(@entry_fee)
      takes_entry_fee_from_guest(new_guest)
      return @guests
    end
    return false
  end

end
