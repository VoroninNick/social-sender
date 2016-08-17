class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.boolean :published
      t.attachment :avatar
      t.string :name
      t.text :content

      t.timestamps null: false
    end
  end
end
