require 'koala'
class Sender
  #GRAPH_QL_TOKEN = "EAACEdEose0cBAHQg4Y5f9YKOfmEk1aK1tDkoRdigif93TaZBzhx2S0gDdH8dB9LDZBMR8Y0ZB4kdRcuCKBZB3vrhVP7XxKixKwoGNzwZCCdQaYuZA5xA1EkYZCcqxy88THZCNZAutd38my5XMiaZB8NfZCzW0qRxdNnZCnaWBO7xDPEEY5iYEy80ZAjgn"
  GRAPH_QL_TOKEN = "EAACEdEose0cBAI8L92zjxqwosXNaeZCjczFKgCTxlsfW8L5jhSIoOrsg16XiSGpFdlY8KNvOg7t7V77Cm2rGBvcTRYfQ4InlphIgveSKh0tehxqXZC8Usb7l73Or0ck9X8eciy3iokQ51jMoKMJKlLKhuc2o4ByogpYoZCSfYGVzS9hE0vE"
  def self.send_to_facebook(message, attachment = {}, target_id = "me", options = {}, tokens = nil,  &block)
    #@graph = Koala::Facebook::API.new(oauth_access_token)
    #profile = @graph.get_object("me")
    #friends = @graph.get_connections("me", "friends")
    #@graph.put_connections("me", "feed", message: "I am writing on my wall!")

    # @api = Koala::Facebook::API.new(oauth_access_token)
    # #fql = @api.fql_query(my_fql_query)
    # @api.put_wall_post(process_result(fql))

    tokens ||= FacebookAccount.all.pluck(:token)

    tokens.each do |token|
      @graph = Koala::Facebook::API.new(token)
    end

    @graph.put_wall_post(message, attachment, target_id, options, &block)
  end
end