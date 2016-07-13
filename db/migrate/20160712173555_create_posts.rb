class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :author
      t.string :author_picture
      t.string :post_picture
      t.text :body

      t.timestamps null: false
    end
  end
end
