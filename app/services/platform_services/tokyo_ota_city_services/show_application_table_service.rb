module PlatformServices
  module TokyoOtaCityServices
    class ShowApplicationTableService
      def initialize(browser, area)
        @browser = browser
        @area    = area
        select_area
        show_calendar
        get_calendar
      end

      def select(date)
        @calendar.elements(xpath: 'descendant::td[attribute::class="CALFEE"]')[date-1].click

        result = {
          display_date: @browser.element(xpath: '/html/body/form[2]/div/table[5]/tbody/tr/td[1]/font[1]').text,
          counter: @browser.element(xpath: '/html/body/form[2]/div/table[5]/tbody/tr/td[1]/font[2]').text,
          facilities: []
        }

        tables = @browser.elements(xpath: '//div/table[attribute::class="STTL"]')
        tables.each do |t|
          rows    = t.text.split(/\n/)
          ranges  = rows[0].split(/ 定員 /)[1].split(/ /)
          name    = rows[2].split(/ - /)[0]
          numbers = rows[2].split(/ - /)[1]

          votes = []
          ranges.size.times do
            votes.push(numbers.slice!(/\D*\s?\d+/))
            numbers.lstrip!
          end

          result[:facilities].push({
            name:   name,
            ranges: ranges,
            votes:  votes,
          })

        end
        puts JSON.pretty_generate(result)
      end

      private

      def select_area
        click_tennis_category

        n = 1 if @area == "Omori"
        n = 2 if @area == "Kojiya"
        n = 3 if @area == "Kamata"
        @browser.element(xpath: "/html/body/form[2]/div/table/tbody/tr[3]/td/table/tbody/tr[4]/td[2]/table/tbody/tr/td[#{n}]/input").click
      end

      def click_tennis_category
        tennis_category_button = @browser.element(xpath: '/html/body/form[2]/div/table/tbody/tr[2]/td/table/tbody/tr[3]/td[3]/input')
        if tennis_category_button.value == "庭球場" then
          tennis_category_button.click
          true
        else
          false
        end
      end

      def show_calendar
        @browser.element(xpath: '/html/body/form[2]/div/table[1]/tbody/tr/td[2]/table[3]/tbody/tr/td/a').click
      end

      def get_calendar
        @calendar = @browser.element(xpath: '/html/body/form[2]/div/table[1]/tbody/tr/td[5]/table[2]/tbody')
      end
    end
  end
end
