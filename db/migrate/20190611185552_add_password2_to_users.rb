class AddPassword2ToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password, :string
  end
end
