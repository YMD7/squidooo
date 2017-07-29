class CreateServiceAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :service_accounts do |t|
      t.belongs_to :user, index: true
      t.belongs_to :service_profile, index: true
      t.string :login
      t.string :password
      t.timestamps
    end
  end
end
