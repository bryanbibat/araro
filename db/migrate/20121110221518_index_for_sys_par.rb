class IndexForSysPar < ActiveRecord::Migration
  def change
    add_index :syspars, :name
  end
end
