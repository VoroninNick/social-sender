class Article < ActiveRecord::Base
  attr_accessible *attribute_names

  image :avatar

  scope :published, -> { where(published: 't') }

  def publish(force = true, fql_token = Sender::GRAPH_QL_TOKEN)
    if force || !self.published_on_facebook_at
      self.published_on_facebook_at = DateTime.now
      self.save
      attachment = {name: "link: #{self.name}", link: "http://animals.com/panda", caption: self.name, description: self.short_description, picture: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/49/Chester_A_Arthur_by_Daniel_Huntington_crop.jpeg/200px-Chester_A_Arthur_by_Daniel_Huntington_crop.jpeg"}
      target_id = "me"
      options = {}
      Sender.send_to_facebook(self.content.html_safe, attachment, target_id, options, fql_token)
    end
  end
end
