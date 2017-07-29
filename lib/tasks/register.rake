namespace :register do
  desc "抽選申込み"
  task :lottery do
    b = Watir::Browser.new :phantomjs

    b.goto 'www.yoyaku.city.ota.tokyo.jp'
    b.element( xpath: '/html/body/form/table/tbody/tr/td[1]/div[4]/table/tbody/tr/td[2]/table/tbody/tr[1]/td[2]/a' ).click

    user_no  = '00099284'
    password = '194362'
    b.text_field( xpath: '/html/body/form[2]/div/div[2]/table/tbody/tr/td/div/table[2]/tbody/tr/td[1]/input[1]' ).set user_no
    b.text_field( xpath: '/html/body/form[2]/div/div[2]/table/tbody/tr/td/div/table[2]/tbody/tr/td[1]/input[2]' ).set password
    b.element(    xpath: '/html/body/form[2]/div/div[2]/table/tbody/tr/td/div/table[2]/tbody/tr/td[1]/div/a' ).click

    html = Nokogiri::HTML.parse(b.html, nil, 'utf-8')

    error_gif = html.xpath('/html/body/form[2]/div/div/table[1]/tbody/tr/td/img[1]')
    if error_gif.empty? then
      puts 'Login Successfully'
      b.element( xpath: '/html/body/form[2]/div/table/tbody/tr[2]/td/table/tbody/tr[3]/td[3]/input' ).click
      b.element( xpath: '/html/body/form[2]/div/table/tbody/tr[3]/td/table/tbody/tr[4]/td[2]/table/tbody/tr/td[3]/input' ).click
      # "show calender"
      b.element( xpath: '/html/body/form[2]/div/table[1]/tbody/tr/td[2]/table[3]/tbody/tr/td/a' ).click
      puts b.element( xpath: '/html/body/form[2]/div/table[1]/tbody/tr/td[5]/table[1]/tbody/tr/td[2]/b' ).text.gsub(/\s/,'')
      # 2017/9/2(sat)
      b.element( xpath: '/html/body/form[2]/div/table[1]/tbody/tr/td[5]/table[2]/tbody/tr[2]/td[7]/table/tbody/tr[1]/td' ).click
      # gas bridge no.1 / 0700-0900
      b.element( xpath: '/html/body/form[2]/div/table[14]/tbody/tr[2]/td[3]/input' ).click
      # apply
      b.element( xpath: '/html/body/form[2]/div/table[19]/tbody/tr/td[2]/a/img' ).click
      # go to comfirm page
      b.element( xpath: '/html/body/form[2]/div/table[21]/tbody/tr/td[2]/a/img' ).click
      # select purpose
      b.select_list( :name => "RiyoumokutekiCD_1" ).select_value "46"
      # comfirm
      b.element( xpath: '/html/body/form[2]/div/table[3]/tbody/tr/td/table/tbody/tr[5]/td[1]/a' ).click
      # finish
      b.element( xpath: '/html/body/form[2]/div/table[3]/tbody/tr/td/table/tbody/tr[3]/td/a[2]' ).click
    else
      puts 'Login Failed'
      puts error_gif.xpath( '/html/body/form[2]/div/div/table[1]/tbody/tr/td/div' ).inner_text.gsub(/\s/,'')
    end

    b.quit
  end
end
