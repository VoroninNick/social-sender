require 'koala'
class Sender
  GRAPH_QL_TOKEN = "EAACEdEose0cBAHQg4Y5f9YKOfmEk1aK1tDkoRdigif93TaZBzhx2S0gDdH8dB9LDZBMR8Y0ZB4kdRcuCKBZB3vrhVP7XxKixKwoGNzwZCCdQaYuZA5xA1EkYZCcqxy88THZCNZAutd38my5XMiaZB8NfZCzW0qRxdNnZCnaWBO7xDPEEY5iYEy80ZAjgn"
  def self.send_to_facebook(message, attachment = {}, target_id = "me", options = {}, token = GRAPH_QL_TOKEN,  &block)
    #@graph = Koala::Facebook::API.new(oauth_access_token)
    #profile = @graph.get_object("me")
    #friends = @graph.get_connections("me", "friends")
    #@graph.put_connections("me", "feed", message: "I am writing on my wall!")

    # @api = Koala::Facebook::API.new(oauth_access_token)
    # #fql = @api.fql_query(my_fql_query)
    # @api.put_wall_post(process_result(fql))

    @graph = Koala::Facebook::API.new(token)
    @graph.put_wall_post(message, attachment, target_id, options, &block)
  end
end