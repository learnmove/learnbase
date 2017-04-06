class AddStatusEvent < ActiveRecord::Migration[5.0]
  def change
  	add_column :events,:status,:string
  end
end
