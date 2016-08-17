class AddPublishedOnFacebookToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :published_on_facebook_at, :datetime
  end
end
