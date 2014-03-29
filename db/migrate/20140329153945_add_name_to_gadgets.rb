class AddNameToGadgets < ActiveRecord::Migration
  def change
    add_column :gadgets, :name, :string
  end
end
