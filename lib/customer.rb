class Customer

	attr_reader :name

	@@customers = []

	def initialize(customers={})
		@name = customers[:name]
		add_to_names
	end

	def self.all
		@@customers
	end

	def self.find_by_name(customer_name)
		@@customers.each do |customer|
			if customer.name == customer_name
				return customer
			end
		end
		puts "There is no such customer with name: #{customer_name}"
	end

	private

	def add_to_names
		customers_names = @@customers.map {|customer| customer.name}
		if customers_names.include? @name
			raise DuplicateCustomerError, "#{@name} already exists"
		else
			@@customers << self
		end
	end

end