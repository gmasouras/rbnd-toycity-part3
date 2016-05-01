class Product

	attr_reader :title, :price
	attr_accessor :stock

	@@products = []

	def initialize(options={})
		@title = options[:title]
		@price = options[:price]
		@stock = options[:stock]
		add_to_products
	end

	def self.all
		@@products
	end

	def self.find_by_title(product_title)
		@@products.each do |product|
			if product.title == product_title
				return product
			end
		end
		puts "There is no such a product with that title: #{product_title}"
	end

	def in_stock?
		@stock > 0		
	end

	def self.in_stock
		@@products.select {|product| product.stock > 0}
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