class Syspar < ActiveRecord::Base
  attr_accessible :description, :name, :value

  DEFAULTS = {
    "starting cash" => 20000 
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
