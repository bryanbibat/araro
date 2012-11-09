class BreedingInstitution < ActiveRecord::Base
  attr_accessible :description, :name

  has_many :varieties
end
