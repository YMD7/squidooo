models = [User, ServiceProfile, ServiceAccount]
models.each do |m|
  yml = File.read("#{Rails.root}/db/seeds/#{m.to_s.tableize}.yml")
  list = YAML.load(yml).symbolize_keys
  list[m.to_s.tableize.to_sym].each do |r|
    m.create do |t|
      r.each do |i, v|
        t.send "#{i}=", v
      end
    end
  end
end
