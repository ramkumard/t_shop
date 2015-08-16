class AddBannerDisplayName < ActiveRecord::Migration
  def change
  	add_column :spree_carousel_banners, :display_name, :string
  	add_column :spree_carousel_banners, :description, :string
  	add_column :spree_carousel_banners, :path, :string
  end
end
