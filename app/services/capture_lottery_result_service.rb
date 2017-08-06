class CaptureLotteryResultService
  def initialize(user, pref, city)
    @user = user
    @pref = pref
    @city = city
  end

  def capture
    @browser = BrowserService.new(@user, @pref, @city, "confirm_results").login
    @json = "PlatformServices::#{@pref}#{@city}CityServices::ResultCaptureService".constantize.new(@browser).get
  end
end
