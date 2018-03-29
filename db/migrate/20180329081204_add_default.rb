class AddDefault < ActiveRecord::Migration[5.1]
  def change
    change_column :jobs, :flag, :boolean, default: true
  end
end
