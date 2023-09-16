class RemoveTitlesFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :titles, :string
  end
end
