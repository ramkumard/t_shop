module Spree
  ProductsController.class_eval do
    before_action :load_product, only: :show
    before_action :load_taxon, only: :index

    rescue_from ActiveRecord::RecordNotFound, :with => :render_404
    helper 'spree/taxons'

    respond_to :html

    def index
      @searcher = build_searcher(params.merge(include_images: true))
      @products,@max_price,@min_price = @searcher.retrieve_products
      @taxonomies = Spree::Taxonomy.includes(root: :children)
    end
  end
end
