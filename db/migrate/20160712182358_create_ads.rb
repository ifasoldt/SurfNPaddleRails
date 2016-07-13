class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string :ad_picture
      t.string :ad_title
      t.string :ad_body

      t.timestamps null: false
    end
  end
end
