class Bar

  attr_reader :name, :rooms
  attr_accessor :till

  def initialize(name, rooms)
    @name = name
    @rooms = rooms
    @till = 0
  end

  def adds_entry_fee_to_till(room, guest)
    entry_fee = room.takes_entry_fee_from_guest(guest)
    @till += entry_fee
  end

  def ushers_in_guests(guest, room1, room2)
    if room1.check_in_guest(guest) == false
      room2.check_in_guest(guest)
    end
  end

end
