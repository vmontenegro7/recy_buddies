class AddPickedUpToPackages < ActiveRecord::Migration[6.1]
  def change
    add_column :packages, :picked_up, :boolean, default: false
  end
end
