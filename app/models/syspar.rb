class Syspar < ActiveRecord::Base
  attr_accessible :description, :name, :value

  DEFAULTS = {
    "starting cash" => 20000,
    "starting farm size" => 3,
    "tractor rent" => 1000,
    "carabao rent" => 300,
    "typhoon % to hit" => 40,
    "typhoon % max damage" => 60,
    "flood % to hit" => 30,
    "flood % max damage" => 60,
    "drought % to hit" => 50,
    "drought % max damage" => 40,
    "weed % to hit" => 100,
    "weed % max damage" => 20,
    "herbicide % max damage" => 5,
    "herbicide cost" => 500,
    "hand weed cost" => 1000,
    "hand mill cost" => 700,
    "machine mill percent cut" => 5
  }

  def self.value_for(name)
    rec = find_by_name(name)
    if rec.nil?
      DEFAULTS[name]
    else
      rec.value
    end
  end

end
