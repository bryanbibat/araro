class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  has_many :plots, conditions: { thresher: nil }

  def display_name
    "Anonymous #{id}"
  end

  def has_available_land?
    plots.empty?
  end

  def can_plant?
    has_available_land? and actions_left > 0
  end

  def next_week
    self.actions_left = 5
    self.day += 7
    save
    plots.each do |plot|
      plot.days += 7
      plot.save
    end
  end

  def new_start?
    day == 1 and actions_left == 5
  end

  def prepare_reset
    self.day = 1
    self.actions_left = 5
    save
  end

  def reset_values
    self.plots = []
    self.cash = Syspar.value_for("starting cash")
    self.farm_size = 3
    save
  end
end
