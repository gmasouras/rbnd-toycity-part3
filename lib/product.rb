class Product

	attr_reader :title

	@@products = []

	def initialize(options={})
		@title = options[:title]
		add_to_products
	end

	def self.all
		@@products
	end

	def self.find_by_title(product_title)

	end

	private

	def add_to_products
		products_titles = @@products.map {|product| product.title}
		if products_titles.include? @title
			raise DuplicateProductError, "#{@title} already exists"
		else
			@@products << self
		end
	end

end