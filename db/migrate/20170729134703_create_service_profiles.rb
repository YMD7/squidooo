class CreateServiceProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :service_profiles do |t|
      t.string :name
      t.string :pref
      t.string :city
      t.string :url
      t.timestamps
    end
  end
end
