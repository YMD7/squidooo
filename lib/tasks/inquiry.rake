namespace :inquiry do
  desc "空き状況の照会"
  task :vacancy do
    b = Watir::Browser.new :phantomjs

    b.goto 'www.yoyaku.city.ota.tokyo.jp'
    b.element( xpath: '/html/body/form/table/tbody/tr/td[1]/div[5]/table/tbody/tr/td[2]/table/tbody/tr[2]/td[2]/a' ).click
    b.element( xpath: '/html/body/form[2]/div/table/tbody/tr[3]/td/table/tbody/tr[4]/td[3]/input' ).click
    b.element( xpath: '/html/body/form[2]/div/table/tbody/tr[4]/td/table[1]/tbody/tr[4]/td[2]/table/tbody/tr/td[3]/input' ).click
    b.element( xpath: '/html/body/form[2]/div/table[2]/tbody/tr/td[3]/table[2]/tbody/tr[6]/td[7]/table/tbody/tr[1]/td' ).click

    html = Nokogiri::HTML.parse(b.html, nil, 'utf-8')

    display_date = html.xpath('/html/body/form[2]/div/table[4]/tbody/tr/td/table/tbody/tr[2]/td[1]').text
    puts display_date.gsub(/\s/,'')

    html.css('table.STTL').each_with_index do |table, i|
      if i < 2 then next end
      row = ""
      table.css('tr').each do |tr|
        tr.css('td').each do |td|
          row << "#{td.text.gsub(/\s/,'')} | "
        end
      end
      puts row
    end

    b.quit
  end
end
