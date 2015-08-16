module Spree
  HomeController.class_eval do
    helper 'spree/products'
    respond_to :html
		before_filter :fetch_carousel_banner, :only => [:index]

  	def fetch_carousel_banner
      @carousels = Spree::CarouselBanner.where(:live => true).sort_by{|e| e.position}.first(5)
  	end

    def index
      @searcher = build_searcher(params.merge(include_images: true))
      @products,@max_price,@min_price = @searcher.retrieve_products
      @taxonomies = Spree::Taxonomy.includes(root: :children)
    end
  end
end
