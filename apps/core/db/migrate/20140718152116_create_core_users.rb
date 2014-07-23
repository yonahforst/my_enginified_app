class CreateCoreUsers < ActiveRecord::Migration
  def change
    create_table :core_users do |t|
      t.string :first_name
      t.string :last_name
      t.string :company_name
      t.string :website_url
      t.string :bio
      t.string :main_phone
      t.string :alt_phone
    
      t.timestamps
    end
  end
end
