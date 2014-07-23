class AddRoleMaskToCoreUsers < ActiveRecord::Migration
  def change
    add_column :core_users, :roles_mask, :integer
  end
end
