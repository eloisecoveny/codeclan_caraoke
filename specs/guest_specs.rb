require("minitest/autorun")
require("minitest/rg")
require_relative("../Guest")
require_relative("../Song")
require_relative("../Room")

class TestGuest < MiniTest::Test

  def setup
    @song1 = Song.new("Video Games", "Lana Del Ray")
    @song2 = Song.new("Under The Milky Way", "The Church")

    @guest1 = Guest.new("Alice", "Video Games", 25)
    @guest2 = Guest.new("George", "Runner Beans", 35)
    @guest3 = Guest.new("Antonia", "Head Over Heels", 5)

    @songs = [@song1, @song2]

    @room = Room.new(7, @songs, @guest)
  end

  def test_get_guest_name
    assert_equal("Alice", @guest1.name)
  end

  def test_get_guest_favourite_song
    assert_equal("Video Games", @guest1.fav_song)
  end

  def test_get_guest_cash
    assert_equal(25, @guest1.cash)
  end

  def test_if_guest_has_enough_money__returns_true
    assert_equal(true, @guest2.can_afford(@room.entry_fee))
  end

  def test_if_guest_has_enough_money__returns_false
    assert_equal(false, @guest3.can_afford(@room.entry_fee))
  end

  def test_pays_entry_fee
    entry_fee = @guest1.pays_entry_fee(@room.entry_fee)
    assert_equal(10, entry_fee)
    assert_equal(15, @guest1.cash)
  end

  def test_room_plays_guests_favourite_song__returns_string
      result = @guest1.plays_favourite_song(@room.playlist)
      assert_equal("Woo Hoo!", result)
  end

  def test_room_plays_guests_favourite_song__returns_nil
    result = @guest2.plays_favourite_song(@room.playlist)
    assert_nil(result)
  end

end
