class AddAttachmentAvatarToCarouselBanners < ActiveRecord::Migration
  def self.up
    change_table :spree_carousel_banners do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :spree_carousel_banners, :avatar
  end
end
