class AddTokenToCoreUsers < ActiveRecord::Migration
  def change
    add_column  :core_users, :authentication_token, :string
    add_index   :core_users, :authentication_token, unique: true
    
  end
end
