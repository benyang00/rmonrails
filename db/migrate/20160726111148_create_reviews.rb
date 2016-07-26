class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.references :user_id, foreign_key: true
      t.references :product_id, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
