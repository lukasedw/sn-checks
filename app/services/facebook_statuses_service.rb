class FacebookStatusesService < ApplicationService
  include SocialNetworkClient

  def call
    response = connection.get("/facebook")
    if response.status != 200
      handle_error(response)
    else
      response.body
    end
  end
end
