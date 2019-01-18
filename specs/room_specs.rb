require("minitest/autorun")
require("minitest/rg")
require_relative("../Room")
require_relative("../Guest")
require_relative("../Song")

class TestRoom < MiniTest::Test

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

    @room = Room.new(7, @songs, @guests)
  end

  def test_get_room_capacity
    assert_equal(7, @room.capacity)
  end

  def test_get_room_playlist
    assert_equal(@songs, @room.playlist)
  end

  def test_get_room_guests
    assert_equal(@guests, @room.guests)
  end

  def test_add_guest_to_room
    @room.add_guest(@guest4)
    assert_equal([@guest1, @guest2, @guest3, @guest4], @room.guests)
  end

  def test_remove_guest_from_room
    @room.remove_guest(@guest1)
    assert_equal([@guest2, @guest3], @room.guests)
  end

  def test_if_there_is_free_space__returns_true
    assert_equal(true, @room.free_space())
  end

  def test_if_there_is_free_space__returns_false
    @room2 = Room.new(3, @songs, @guests)
    assert_equal(false, @room2.free_space())
  end

  def test_adds_cash_to_kitty()
    @room.adds_cash_to_kitty()
    assert_equal(10, @room.kitty)
  end

  def test_check_in_guest__succeeds
    guest_checks_in = @room.check_in_guest(@guest5)
    assert_equal([@guest1, @guest2, @guest3, @guest5], guest_checks_in)
  end

end
