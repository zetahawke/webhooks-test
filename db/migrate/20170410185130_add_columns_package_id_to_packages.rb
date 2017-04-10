class AddColumnsPackageIdToPackages < ActiveRecord::Migration[5.0]
  def change
    add_column :packages, :package_id, :integer
  end
end
