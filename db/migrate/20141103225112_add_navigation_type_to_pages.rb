class AddNavigationTypeToPages < ActiveRecord::Migration[5.1]
	def change
		add_column :webinius_cms_pages, :navigation_type, :string 
	end
end
