class CreateEventlists < ActiveRecord::Migration
  def change
    create_table :eventlists do |t|
      t.text :info

      t.timestamps
    end
  end
end
