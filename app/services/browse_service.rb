class BrowseService
  attr_reader :user, :pref, :city, :browser

  def initialize(user, pref, city)
    @user = user
    @pref = pref
    @city = city

    @browser = Watir::Browser.new :phantomjs
    @browser.goto url
  end

  def login
    "LoginServices::#{@pref}#{@city}CityService".constantize.new(self)
    @browser.close
  end

  private

  def url
    ServiceProfile.find_by(pref: pref, city: city).url
  end
end
