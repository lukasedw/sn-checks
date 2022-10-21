module SocialNetworkClient
  def connection
    Faraday.new(ENV.fetch("SOCIAL_NETWORK_API_URL")) do |conn|
      conn.response :json
    end
  end

  def handle_error(response)
    message = "It was not possible to have a response from #{self.class}"
    Rails.logger.warn "#{message}: #{response.body}"
    raise Failed, message
  end

  class Failed < StandardError; end
end
