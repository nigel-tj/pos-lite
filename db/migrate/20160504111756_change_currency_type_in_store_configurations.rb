class ChangeCurrencyTypeInStoreConfigurations < ActiveRecord::Migration[5.0]
  def change
  	 change_column :store_configurations, :currency, :string
  end
end
