class Plot < ActiveRecord::Base
  belongs_to :user
  belongs_to :variety
  attr_accessible :variety

  before_create :shuffle_events

  def shuffle_events
    event_deck = [
      "weed",
      "insect",
      "disease",
      "rat",
      "bird",
      "snail",
      "drought",
      "flood",
      "typhoon",
      "higher wage"
    ]
    weeks = (variety.maturity / 7)
    blank_count = weeks - event_deck.size
    blank_count.times { event_deck << "" }
    self.event_deck = ([""] + event_deck.shuffle).to_json
  end

  def week
    days / 7
  end

  def possible_event
    deck = JSON.parse(event_deck)
    unless deck[week].blank?
      deck[week]
    end
  end
end
