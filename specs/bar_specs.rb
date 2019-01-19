require("minitest/autorun")
require("minitest/rg")
require_relative("../Bar")
require_relative("../Guest")
require_relative("../Room")
require_relative("../Song")

class TestBar < MiniTest::Test

  def setup
    @song1 = Song.new("Video Games", "Lana Del Ray")
    @song2 = Song.new("Under The Milky Way", "The Church")
    @song3 = Song.new("Head Over Heels", "Tears for Fears")
    @song4 = Song.new("Alone in Kyoto", "Air")

    @songs = [@song1, @song2, @song3, @song4]

    @guest1 = Guest.new("Alice", "Video Games", 25)
    @guest2 = Guest.new("George", "Runner Beans", 35)
    @guest3 = Guest.new("Bobby", "Alone in Kyoto", 15)
    @guest4 = Guest.new("Antonia", "Head Over Heels", 5)
    @guest5 = Guest.new("Mark", "Born Wild", 40)

    @guests = [@guest1, @guest2, @guest3]

    @room1 = Room.new(3, @songs, @guests)
    @room2 = Room.new(4, @songs, [])

    @rooms = [@room1, @room2]

    @bar = Bar.new("CodeClan Caraoke", @rooms)
  end

  def test_get_bar_name
    assert_equal("CodeClan Caraoke", @bar.name)
  end

  def test_get_bar_rooms
    assert_equal([@room1, @room2], @bar.rooms)
  end

  def test_takes_entry_fees_from_room
    @room1.takes_entry_fee_from_guest(@guest5)
    @bar.adds_entry_fee_to_till(@room1, @guest5)
    assert_equal(10, @bar.till)
  end

  def test_bar_ushers_guests_to_rooms
    @room1 = Room.new(2, @songs, [@guest1, @guest2])
    @room2 = Room.new(4, @songs, [])
    @bar.ushers_in_guests(@guest5, @room1, @room2)
    assert_equal([@guest5], @room2.guests)
  end

end
