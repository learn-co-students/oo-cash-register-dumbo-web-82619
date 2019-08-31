class CashRegister
  attr_accessor :total, :discount, :items, :transactions
  @@all = []

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @transactions = []
    @@all << self
  end

  def self.all
    @@all
  end

  def add_item(title, price, quantity = 1)
    @total += price * quantity
    @transactions << price * quantity
    if quantity > 1
      quantity.times {@items << title}
    else
      @items << title
    end
  end

  def apply_discount
    if discount == 0
      "There is no discount to apply."
    else
      @total -= (@total * discount / 100)
      "After the discount, the total comes to $#{@total}."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total -= @transactions.pop
  end

end

