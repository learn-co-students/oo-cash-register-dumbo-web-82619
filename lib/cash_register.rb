class CashRegister
  def initialize(discount = 0)
    @total = 0 
    @discount = discount
    @items = []
    @cart  = []
  end 
  
  def discount 
    @discount
  end 
  
  attr_accessor :total 
  
  def add_item(name, price, quantity=1)
    quantity.times do @items << name
    end 
    @total += price*quantity
    @cart << price*quantity 
  end
  
  def apply_discount
    if @discount > 0
    @total = @total * (100-@discount) / 100 
    "After the discount, the total comes to $#{@total}."
    else "There is no discount to apply."
    end
  end
  
  def items 
    @items 
  end 
    
  def void_last_transaction 
    @total -= @cart.last 
    @items.pop
  end 
    
  
end 