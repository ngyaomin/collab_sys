class UpdateDefaultValueForUsers < ActiveRecord::Migration[5.0]
  def up
    change_column :users, :subscribe, :boolean, :default => true
  end
end
