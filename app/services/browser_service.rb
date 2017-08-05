class BrowserService
  def initialize(user, pref, city, dest)
    @user = user
    @pref = pref
    @city = city
    @dest = dest

    @browser = Watir::Browser.new :phantomjs
    @browser.goto url
  end

  def login
    "PlatformServices::#{@pref}#{@city}CityServices::LoginService".constantize.new(@user, @pref, @city, @dest, @browser)
    @browser
  end

  private

  attr_reader :user, :pref, :city, :dest, :browser

  def url
    ServiceProfile.find_by(pref: pref, city: city).url
  end
end
