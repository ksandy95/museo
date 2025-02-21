require_relative 'test_helper'

class CuratorTest < MiniTest::Test

  def setup
    @photo_1 = { id: "1",
                 name: "Rue Mouffetard, Paris (Boy with Bottles)",
                 artist_id: "1",
                 year: "1954" }
    @photo_2 = { id: "2",
                 name: "Moonrise, Hernandez",
                 artist_id: "2",
                 year: "1941" }
    @photo_3 = { id: "3",
                 name: "Identical Twins, Roselle, New Jersey",
                 artist_id: "3",
                 year: "1967" }
    @photo_4 = { id: "4",
                 name: "Child with Toy Hand Grenade in Central Park",
                 artist_id: "3",
                 year: "1962" }
    @artist_1 = {id: "1",
                 name: "Henri Cartier-Bresson",
                 born: "1908",
                 died: "2004",
                 country: "France"}
    @artist_2 = { id: "2",
                  name: "Ansel Adams",
                  born: "1902",
                  died: "1984",
                  country: "United States"}
    @artist_3 = { id: "3",
                  name: "Diane Arbus",
                  born: "1923",
                  died: "1971",
                  country: "United States"}
    @curator = Curator.new
  end

  def test_it_exists
    assert_instance_of Curator, @curator
  end

  def test_curator_attributes
    assert_equal [], @curator.artists
    assert_equal [], @curator.photographs
  end

  def test_adds_photpgraphs
    p1 = @curator.add_photograph(@photo_1).first
    p2 = @curator.add_photograph(@photo_2).last
    assert_equal [p1, p2], @curator.photographs
    assert_equal p1, @curator.photographs.first
    assert_equal "Rue Mouffetard, Paris (Boy with Bottles)", @curator.photographs.first.name
  end

  def test_add_artists
    a1 = @curator.add_artist(@artist_1).first
    a2 = @curator.add_artist(@artist_2).last
    assert_equal [a1, a2], @curator.artists
    assert_equal a1 , @curator.artists.first
    assert_equal "Henri Cartier-Bresson", @curator.artists.first.name
  end

  def test_by_id
    p1 = @curator.add_photograph(@photo_1).first
    p2 = @curator.add_photograph(@photo_2).last
    a1 = @curator.add_artist(@artist_1).first
    a2 = @curator.add_artist(@artist_2).last
    assert_equal a1, @curator.find_artist_by_id("1")
    assert_equal p2, @curator.find_photograph_by_id("2")
  end

  def test_artists_with_multiple_photographs
    p1 = @curator.add_photograph(@photo_1)
    p2 = @curator.add_photograph(@photo_2)
    p3 = @curator.add_photograph(@photo_3)
    p4 = @curator.add_photograph(@photo_4)
    a1 = @curator.add_artist(@artist_1)
    a2 = @curator.add_artist(@artist_2)
    a3 = @curator.add_artist(@artist_3)
    # assert_equal a3, diane_arbus = @curator.find_artist_by_id("3")
    assert_equal a3, @curator.artists_with_multiple_photographs
    # assert_equal 1, @curator.artists_with_multiple_photographs.length
    # assert diane_arbus == @curator.artists_with_multiple_photographs.first
    # assert_equal [p2, p3], @curator.photographs_taken_by_artist_from("United States")
    # assert_equal [], @curator.photographs_taken_by_artist_from("Argentina")
  end

end
