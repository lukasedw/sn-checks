class OverallService < ApplicationService

  def call
    @errors = []
    result = {
      twitter: twitter,
      facebook: facebook,
      instagram: instagram
    }
    result[:errors] = @errors if @errors.present?
    result
  end

  def twitter
    begin
      TwitterTweetsService.call
    rescue TwitterTweetsService::Failed => e
      @errors << e.message
      nil
    end
  end

  def facebook
    begin
      FacebookStatusesService.call
    rescue FacebookStatusesService::Failed => e
      @errors << e.message
      nil
    end
  end

  def instagram
    begin
      InstagramPicturesService.call
    rescue InstagramPicturesService::Failed => e
      @errors << e.message
      nil
    end
  end
end
