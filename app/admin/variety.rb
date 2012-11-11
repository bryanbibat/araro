ActiveAdmin.register Variety do
  index do
    column :name
    column :common_name
    column :line_designation
    column :year_approved
    column :breeding_institution
    default_actions
  end

  filter :name

  form do |f|
    f.inputs "Variety Information" do
      f.input :name
      f.input :common_name
      f.input :line_designation
      f.input :year_approved
      f.input :breeding_institution
      f.input :buy_price, label: "Buy Price (per ha)"
      f.input :sell_price, label: "Sell Price (per ha)"
    end

    f.inputs "Agronomic Characteristics" do
      f.input :ave_yield, label: "Average yield (ton/ha)"
      f.input :max_yield, label: "Max yield (ton/ha)"
      f.input :maturity, label: "Maturity (days)"
      f.input :height, label: "Height (cm)"
    end

    f.inputs "Disease and Insect Pest Reactions" do
      f.input :heat_rating, label: "Heat", as: "select", collection: Variety::REACTIONS
      f.input :salinity_rating, label: "Salinity", as: "select", collection: Variety::REACTIONS
      f.input :drought_rating, label: "Drought", as: "select", collection: Variety::REACTIONS
      f.input :flood_rating, label: "Flood", as: "select", collection: Variety::REACTIONS
      f.input :blast_rating, label: "Blast", as: "select", collection: Variety::REACTIONS
      f.input :blb_rating, label: "Bacterial Leaf Blight (BLB)", as: "select", collection: Variety::REACTIONS
      f.input :shb_rating, label: "Sheath Blight (ShB)", as: "select", collection: Variety::REACTIONS
      f.input :tungro_rating, label: "Tungro", as: "select", collection: Variety::REACTIONS
      f.input :bph_rating, label: "Brown Planthopper (BPH)", as: "select", collection: Variety::REACTIONS
      f.input :glh_rating, label: "Green Leafhopper (GLH)", as: "select", collection: Variety::REACTIONS
      f.input :stemborer_rating, label: "Stemborer", as: "select", collection: Variety::REACTIONS
    end

    f.inputs "Grain Quality Characteristics" do
      f.input :amylose_content, label: "% Amylose Content"
      f.input :protein, label: "% Protein"
      f.input :gt_score, label: "G.T. Score"
      f.input :brown_rice, label: "% Brown Rice"
      f.input :milling_recovery, label: "% Milling Recovery"
      f.input :head_rice, label: "% Head Rice"
      f.input :chalky_grains, label: "% Chalky Grains"
      f.input :immature_grains, label: "% Immature Grains"
      f.input :grain_length, label: "Grain Length/Size (mm)"
      f.input :grain_shape, label: "Grain Shape (L/W)"
      f.input :acceptability_cooked, label: "% Acceptabilty (Cooked)"
      f.input :acceptability_raw, label: "% Acceptability (Raw)"
    end
    f.buttons
  end

  show do |ad|
    attributes_table do
      row :name
      row :breeding_institution
      row :blast do
        ad.blast_symbol
      end
    end
    active_admin_comments
  end
end
