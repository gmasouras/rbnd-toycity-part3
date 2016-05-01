class Transaction

	attr_reader :customer, :product, :id

	@@id = 1

	def initialize(customer, product)
		@id = @@id
		@@id += 1
		@customer = customer
		@product = product
		decrease_product_stock
	end

	private

	def decrease_product_stock
		@product.stock -= 1 if @product.stock > 0 		
	end



end