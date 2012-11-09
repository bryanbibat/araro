class CreateBreedingInstitutions < ActiveRecord::Migration
  def change
    create_table :breeding_institutions do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
