require("minitest/autorun")
require("minitest/rg")
require_relative("../Guest")
require_relative("../Song")
require_relative("../Room")

class TestGuest < MiniTest::Test

  def setup
    @song = Song.new("Video Games", "Lana Del Ray")

    @guest1 = Guest.new("Alice", "Video Games", 25)
    @guest2 = Guest.new("George", "Runner Beans", 35)
    @guest3 = Guest.new("Antonia", "Head Over Heels", 5)

    @room = Room.new(7, @song, @guest)
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
    @guest1.pays_entry_fee(@room.entry_fee)
    assert_equal(15, @guest1.cash)
  end

end
