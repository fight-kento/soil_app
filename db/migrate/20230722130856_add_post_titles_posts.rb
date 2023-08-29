class AddPostTitlesPosts < ActiveRecord::Migration[7.0]
  def change
    def change
      add_column :posts, :titles, :string
    end
  end
end
