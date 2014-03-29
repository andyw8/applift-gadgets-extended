class AddOwnerToGadget < ActiveRecord::Migration
  def change
    add_column :gadgets, :owner_id, :integer
  end
  # TODO add index
end
