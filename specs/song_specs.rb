require("minitest/autorun")
require("minitest/rg")
require_relative("../Song")

class TestSong < MiniTest::Test

  def setup
    @song = Song.new("Video Games", "Lana Del Ray")
  end

  def test_get_song_title
    assert_equal("Video Games", @song.title)
  end

  def test_get_song_artist
    assert_equal("Lana Del Ray", @song.artist)
  end


end
