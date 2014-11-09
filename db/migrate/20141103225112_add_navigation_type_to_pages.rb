class AddNavigationTypeToPages < ActiveRecord::Migration
	def change
		add_column :webinius_cms_pages, :navigation_type, :string 
	end
end
