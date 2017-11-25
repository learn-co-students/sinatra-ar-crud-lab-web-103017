class ChangeColumns < ActiveRecord::Migration
  def change
    rename_column :posts, :posts, :content
  end
end
