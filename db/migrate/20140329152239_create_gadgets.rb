class CreateGadgets < ActiveRecord::Migration
  def change
    create_table :gadgets do |t|

      t.timestamps
    end
  end
end
