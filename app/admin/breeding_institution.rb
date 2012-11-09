ActiveAdmin.register BreedingInstitution do
  index do
    column :name
    column :description
    default_actions
  end

  filter :name

  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :description
    end
    f.buttons
  end
end
