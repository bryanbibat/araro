class BreedingInstitution < ActiveRecord::Base
  attr_accessible :description, :name

  has_many :varieties

  validates_presence_of :name
end
