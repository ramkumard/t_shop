class CreateSpreeCarouselBanners < ActiveRecord::Migration
  def change
    create_table :spree_carousel_banners do |t|
    	t.string :name
    	t.boolean :live
    	t.integer :position
      t.timestamps null: false
    end
  end
end
