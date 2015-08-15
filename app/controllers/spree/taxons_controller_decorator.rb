module Spree
  TaxonsController.class_eval do
    rescue_from ActiveRecord::RecordNotFound, with: :render_404
    helper 'spree/products'

    respond_to :html

    def show
      @taxon = Taxon.friendly.find(params[:id])
      return unless @taxon

      @searcher = build_searcher(params.merge(taxon: @taxon.id, include_images: true))
      @products,@max_price,@min_price = @searcher.retrieve_products
      @taxonomies = Spree::Taxonomy.includes(root: :children)
    end

    private

    def accurate_title
      if @taxon
        @taxon.seo_title
      else
        super
      end
    end
  end
end
