class Variety < ActiveRecord::Base
  attr_accessible :acceptability_cooked, :acceptability_raw, :amylose_content, :ave_yield, :blast_rating, :blb_rating, :bph_rating, :breeding_institution_id, :brown_rice, :chalky_grains, :common_name, :glh_rating, :grain_length, :grain_shape, :gt_score, :head_rice, :height, :immature_grains, :line_designation, :maturity, :max_yield, :milling_recovery, :name, :protein, :shb_rating, :stemborer_rating, :tungro_rating, :year_approved, :buy_price, :sell_price, :heat_rating, :salinity_rating, :drought_rating, :flood_rating

  belongs_to :breeding_institution

  REACTIONS = { "Susceptible (Susceptible)" => 0,
                "Susceptible" => 10, 
                "Moderately Susceptible" => 20, 
                "Moderately Susceptible to Intermediate" => 25, 
                "Intermediate" => 30, 
                "Moderately Resistant" => 40, 
                "Resistant" => 50 }
  REACTION_LOOKUP = REACTIONS.invert
  REACTION_SYMBOLS = { "Susceptible (Susceptible)" => "S (S)",
                       "Susceptible" => "S", 
                       "Moderately Susceptible" => "MS", 
                       "Moderately Susceptible to Intermediate" => "MS to I", 
                       "Intermediate" => "I", 
                       "Moderately Resistant" => "MR", 
                       "Resistant" => "R" }


  def blast_reaction
    REACTION_LOOKUP[blast_rating]
  end

  def blast_symbol
    REACTION_SYMBOLS[REACTION_LOOKUP[blast_rating]]
  end
end
