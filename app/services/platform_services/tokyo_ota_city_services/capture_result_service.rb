module PlatformServices
  module TokyoOtaCityServices
    class CaptureResultService
      def initialize(browser)
        @browser = browser
        @html    = Nokogiri::HTML.parse(@browser.html)
      end

      def get_result
        @rows   = get_rows
        @header = get_header

        key = Time.current.strftime('%Y%m')
        hash = { key => [] }
        regi_no, head_row = "", false

        @rows.each do |tr|
          tr.xpath('descendant::td').each_with_index do |td, i|
            if i == 0 then
              if td.attr("rowspan") then
                head_row = true
                regi_no  = td.text.gsub(/\s/,'')
                hash[key].push({ regi_no => [] })
              else
                head_row = false
                hash[key][-1][regi_no].push({ @header[i+1] => td.text.gsub(/\s/,'') })
              end
            else
              if head_row then
                if hash[key][-1][regi_no].empty? then
                  hash[key][-1][regi_no].push({ @header[i] => td.text.gsub(/\s/,'') })
                end
                hash[key][-1][regi_no][-1][@header[i]] = td.text.gsub(/\s/,'')
              else
                hash[key][-1][regi_no][-1][@header[i+1]] = td.text.gsub(/\s/,'')
              end
            end
          end
        end
        @browser.close
        hash
      end

      private

      def get_rows
        @html.xpath('//form[2]/div/table[2]/tbody/tr/td/table[3]/tbody/tr')
      end

      def get_header
        @rows.shift.xpath('descendant::td').map do |td|
          td.text.gsub(/\s/,'')
        end
      end
    end
  end
end
