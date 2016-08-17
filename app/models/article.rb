class Article < ActiveRecord::Base
  attr_accessible *attribute_names

  image :avatar

  scope :published, -> { where(published: 't') }

  def publish(force = true, fql_token = Sender::GRAPH_QL_TOKEN)
    if force || !self.published_on_facebook_at
      self.published_on_facebook_at = DateTime.now
      self.save
      attachment = {name: "link: #{self.name}", link: self.url, caption: self.name, description: self.short_description, picture: self.avatar_url}
      target_id = "me"
      options = {}
      Sender.send_to_facebook(self.short_description, attachment, target_id, options, fql_token)
    end
  end

  def url
    host = ENV["host"]
    "#{host}/articles/#{self.id}"
  end

  def avatar_url
    host = ENV["host"]
    "#{host}#{self.avatar.url}"
  end
end
