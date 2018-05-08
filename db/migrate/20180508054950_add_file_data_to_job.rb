class AddFileDataToJob < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :file_data, :text
  end
end
