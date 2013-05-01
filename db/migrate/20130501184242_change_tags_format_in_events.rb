class ChangeTagsFormatInEvents < ActiveRecord::Migration
  def up
     change_column :events, :tags, :text
  end

  def down
     change_column :events, :tags, :string
  end
end
