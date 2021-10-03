class InvoiceEntry
  attr_reader :product_name
  attr_accessor :quantity

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    self.quantity = updated_count if updated_count >= 0 #self is needed when calling an instance setter method, otherwise Ruby thinks you are initialize in a local variable.
  end
end

banana = InvoiceEntry.new("banana", 5)
p banana.quantity
banana.update_quantity(10)
p banana.quantity
