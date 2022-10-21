class OverallService < ApplicationService

  def call
    @errors = []
    result = {
      twitter: twitter
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

end