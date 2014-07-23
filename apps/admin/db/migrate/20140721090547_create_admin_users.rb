class CreateAdminUsers < ActiveRecord::Migration
  def change
    create_table :admin_users do |t|

      t.timestamps
    end
  end
end
