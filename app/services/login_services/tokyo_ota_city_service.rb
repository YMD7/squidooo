module LoginServices
  class TokyoOtaCityService
    def initialize(service)
      @service = service
      @browser = service.browser
      login_to(service.dest)
    end
  
    private
    
    def login_to(dest)
      if dest == "register_lottery"     then n = 1 end
      if dest == "comfirm_registration" then n = 2 end
      @browser.element(xpath: "/html/body/form/table/tbody/tr/td[1]/div[4]/table/tbody/tr/td[2]/table/tbody/tr[#{n}]/td[2]/a").click
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
