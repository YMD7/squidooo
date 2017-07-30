class BrowseService
  attr_reader :user, :pref, :city, :dest, :browser

  def initialize(user, pref, city, dest)
    @user = user
    @pref = pref
    @city = city
    @dest = dest

    @browser = Watir::Browser.new :phantomjs
    @browser.goto url
  end

  def login
    "LoginServices::#{@pref}#{@city}CityService".constantize.new(self)
  end

  private

  def url
    ServiceProfile.find_by(pref: pref, city: city).url
  end
end
