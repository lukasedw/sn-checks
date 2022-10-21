module SocialNetworkClient
  def connection
    Faraday.new(ENV.fetch("SOCIAL_NETWORK_API_URL")) do |conn|
      conn.response :json
      conn.request :retry, {
        retry_statuses: [500],
        max: 5,
        interval: 0.05,
        interval_randomness: 0.5,
        backoff_factor: 2
      } if !Rails.env.test?
    end
  end

  def handle_error(response)
    message = "It was not possible to have a response from #{self.class}"
    Rails.logger.warn "#{message}: #{response.body}"
    raise Failed, message
  end

  class Failed < StandardError; end
end
