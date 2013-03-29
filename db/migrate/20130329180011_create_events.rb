class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :guid
      t.string :location
      t.datetime :start
      t.datetime :end
      t.string :event_link
      t.text :description
      t.string :tags
      t.string :contact_name
      t.string :contact_phone
      t.string :contact_link

      t.timestamps
    end
  end
end
