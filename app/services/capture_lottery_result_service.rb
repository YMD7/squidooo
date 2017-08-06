class CaptureLotteryResultService
  def initialize(user, pref, city)
    @user = user
    @pref = pref
    @city = city
  end

  def capture
    @browser = BrowserService.new(@user, @pref, @city, "confirm_results").login
    @result  = "PlatformServices::#{@pref}#{@city}CityServices::CaptureResultService".constantize.new(@browser).get_result
    put_yaml
  end

  private

  def put_yaml
    dir  = "#{Rails.root}/private/user/#{@user.id}/#{@pref}#{@city}City/lottery_results"
    FileUtils.mkdir_p(dir) unless FileTest.exist?(dir)
    path = "#{dir}/#{@result.keys[0].to_s}.yml"

    File.open(path,"w") do |f|
      f.puts(JSON.parse(@result.to_json).to_yaml)
    end
    puts "Created a YAML file \"#{path}\""
    path
  end
end
