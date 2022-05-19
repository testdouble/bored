require "test_helper"

class TestBored < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Bored::VERSION
  end

  def test_that_it_gives_you_an_activity
    activity = Bored.now

    assert_kind_of Numeric, activity.id
    assert_kind_of String, activity.description
    assert_includes([
      :education, :recreational, :social, :diy, :charity,
      :cooking, :relaxation, :music, :busywork
    ], activity.type)
    assert_kind_of Integer, activity.participants
    assert (0..1).cover?(activity.accessibility)
    assert (0..1).cover?(activity.price)
    assert [String, NilClass].include?(activity.link.class)
  end

  def test_that_it_gives_you_an_activity_with_a_specific_key
    activity = Bored.now(key: "1878070")

    assert_equal "Volunteer at your local food pantry", activity.description
    assert_equal 1, activity.participants
    assert_equal :charity, activity.type
  end

  def test_that_it_raises_an_error_with_a_bad_key
    assert_raises Bored::Error do
      Bored.now(key: "bogus")
    end
  end

  def test_that_you_can_query_by_participants
    activity = Bored.now(participants: 3)

    assert_equal 3, activity.participants
  end

  def test_that_it_can_search_on_two_criteria
    activity = Bored.now(key: "1878070", participants: 1)

    assert_equal "Volunteer at your local food pantry", activity.description
  end

  def test_that_it_raises_when_two_criteria_yield_no_results
    assert_raises Bored::Error do
      Bored.now(key: "1878070", participants: 2)
    end
  end

  def test_that_we_handle_type_arguments
    activity = Bored.now(type: "recreational")
    assert_equal activity.type, :recreational
  end
end
