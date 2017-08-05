module PlatformServices
  module TokyoOtaCityServices
    class LoginService
      def initialize(user, pref, city, dest, browser)
        @user    = user
        @pref    = pref
        @city    = city
        @dest    = dest
        @browser = browser
        login_to()
      end

      private

      def login_to()
        n = 1 if @dest == "register_lottery"
        n = 2 if @dest == "comfirm_registrations"
        n = 3 if @dest == "comfirm_results"
        @browser.element(xpath: "/html/body/form/table/tbody/tr/td[1]/div[4]/table/tbody/tr/td[2]/table/tbody/tr[#{n}]/td[2]/a").click
        @browser.text_field( xpath: '/html/body/form[2]/div/div[2]/table/tbody/tr/td/div/table[2]/tbody/tr/td[1]/input[1]' ).set cerfs[:login_id]
        @browser.text_field( xpath: '/html/body/form[2]/div/div[2]/table/tbody/tr/td/div/table[2]/tbody/tr/td[1]/input[2]' ).set cerfs[:password]
        @browser.element( xpath: '/html/body/form[2]/div/div[2]/table/tbody/tr/td/div/table[2]/tbody/tr/td[1]/div/a' ).click
        @browser
      end

      def cerfs
        service_profile = ServiceProfile.find_by(pref: @pref, city: @city)
        account = ServiceAccount.find_by(user_id: @user.id, service_profile_id: service_profile.id)
        { login_id: account.login, password: account.password }
      end
    end
  end
end
