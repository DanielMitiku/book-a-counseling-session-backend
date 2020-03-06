class AddImageUrlToCounselings < ActiveRecord::Migration[6.0]
  def change
    add_column :counselings, :image_url, :string
  end
end
