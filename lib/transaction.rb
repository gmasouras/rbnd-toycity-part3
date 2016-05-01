class Transaction

	attr_reader :customer, :product, :id

	@@id = 1
	@@transactions = []

	def initialize(customer, product)
		@id = @@id
		@@id += 1
		@customer = customer
		@product = product
		add_to_transactions
		decrease_product_stock
	end

	def self.all
		@@transactions
	end

	def self.find(num)
		@@transactions[num-1]
	end

	private

	def decrease_product_stock
		@product.stock -= 1 if @product.stock > 0 		
	end

	private

	def add_to_transactions
		@@transactions << self
	end



end