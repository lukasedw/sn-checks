class TwitterTweetsService < ApplicationService
  include SocialNetworkClient

  def call
    response = connection.get("/twitter")
    if response.status != 200
      handle_error(response)
    else
      response.body
    end
  end
end