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

	def self.find_by_customer(customer_name)
		customer_transactions = @@transactions.select {|transaction|  transaction.customer.name == customer_name}
	end

	def self.find_bigger(product_price)
		product_transactions = @@transactions.select {|transaction|  transaction.product.price > product_price}
	end

	def self.sort_by_customer
		@@transactions.sort_by {|transaction| transaction.customer.name}
	end

	def self.find(num)
		if num >= 1 && num < @@transactions.length + 1
			@@transactions[num-1]
		else
			puts "There is no transaction with id: #{num}"
		end
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