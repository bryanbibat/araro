class CreateSyspars < ActiveRecord::Migration
  def change
    create_table :syspars do |t|
      t.decimal :value
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
