class RemoveAuthorPictureFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :author_picture, :string
  end
end
