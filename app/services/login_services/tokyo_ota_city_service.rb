module LoginServices
  class TokyoOtaCityService
    def initialize(service)
      @service = service
      @browser = service.browser
      login
    end
  
    private
    
    def login
      @browser.element(xpath: '/html/body/form/table/tbody/tr/td[1]/div[4]/table/tbody/tr/td[2]/table/tbody/tr[1]/td[2]/a').click
      @browser.text_field( xpath: '/html/body/form[2]/div/div[2]/table/tbody/tr/td/div/table[2]/tbody/tr/td[1]/input[1]' ).set cerfs[:login_id]
      @browser.text_field( xpath: '/html/body/form[2]/div/div[2]/table/tbody/tr/td/div/table[2]/tbody/tr/td[1]/input[2]' ).set cerfs[:password]
      @browser.element( xpath: '/html/body/form[2]/div/div[2]/table/tbody/tr/td/div/table[2]/tbody/tr/td[1]/div/a' ).click
    end

    def cerfs
      user = @service.user
      pref = @service.pref
      city = @service.city

      service_profile = ServiceProfile.find_by(pref: pref, city: city)
      account = ServiceAccount.find_by(user_id: user.id, service_profile_id: service_profile.id)
      { login_id: account.login, password: account.password }
    end
  end
end
