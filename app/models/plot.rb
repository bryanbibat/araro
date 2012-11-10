class Plot < ActiveRecord::Base
  belongs_to :user
  belongs_to :variety
  attr_accessible :variety

  before_create :shuffle_events, :set_initial_yield

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
      "higher wage",
      "good insects"
    ]
    weeks = (variety.maturity / 7)
    blank_count = weeks - event_deck.size
    blank_count.times { event_deck << "" }
    self.event_deck = ([""] + event_deck.shuffle).to_json
  end

  def set_initial_yield
    self.expected_yield = variety.max_yield * user.farm_size
  end

  def week
    days / 7
  end

  def days_left
    variety.maturity - days
  end

  def weeks_left
    days_left / 7 + 1
  end

  def next_week
    self.days += 7
    self.current_event = nil
    if possible_event
      if possible_event == "typhoon" and element != "fire"
        if rand(100) < Syspar.value_for("typhoon % to hit")
          self.current_event = "typhoon"
        end
      elsif possible_event == "flood" and element != "fire"
        if rand(100) < Syspar.value_for("flood % to hit")
          self.current_event = "flood"
        end
      elsif possible_event == "drought" and element != "water"
        if rand(100) < Syspar.value_for("drought % to hit")
          self.current_event = "drought"
        end
      elsif possible_event == "weed"
        if rand(100) < Syspar.value_for("weed % to hit")
          self.current_event = "weed"
        end
      end
    end
    save
  end

  def possible_event
    deck = JSON.parse(event_deck)
    unless deck[week].blank?
      deck[week]
    end
  end
end
