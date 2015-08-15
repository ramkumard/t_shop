module Spree
  HomeController.class_eval do
    helper 'spree/products'
    respond_to :html

    def index
      @searcher = build_searcher(params.merge(include_images: true))
      @products,@max_price,@min_price = @searcher.retrieve_products
      @taxonomies = Spree::Taxonomy.includes(root: :children)
    end
  end
end
