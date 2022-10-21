class InstagramPicturesService < ApplicationService
  include SocialNetworkClient

  def call
    response = connection.get("/instagram")
    if response.status != 200
      handle_error(response)
    else
      response.body
    end
  end
end
