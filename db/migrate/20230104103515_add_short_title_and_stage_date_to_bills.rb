class AddShortTitleAndStageDateToBills < ActiveRecord::Migration[7.0]
  def change
    add_column :bills, :short_title, :string
    add_column :bills, :stage_date, :datetime
  end
end
