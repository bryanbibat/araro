class Variety < ActiveRecord::Base
  attr_accessible :acceptability_cooked, :acceptability_raw, :amylose_content, :ave_yield, :blast_rating, :blb_rating, :bph_rating, :breeding_institution_id, :brown_rice, :chalky_grains, :common_name, :glh, :grain_length, :grain_shape, :gt_score, :head_rice, :height, :immature_grains, :line_designation, :maturity, :max_yield, :milling_recovery, :name, :protein, :shb_rating, :stemborer_rating, :tungro_rating, :year_approved

  belongs_to :breeding_institution
end
