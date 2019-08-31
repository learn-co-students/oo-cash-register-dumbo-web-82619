require 'pry'

class CashRegister
    attr_reader(:discount, :item_list, :cost_list, :quantity_list)
    attr_accessor(:total)

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @item_list = []
        @cost_list = []
        @quantity_list = []
    end

    def add_item(title, price, quantity = 1)
        @total += price * quantity
        i = 1
        while i <= quantity
            @item_list << title
            @cost_list << price
            i += 1
        end
        @quantity_list << quantity
    end

    def apply_discount
        if discount > 0
            new_total = @total -= @total * (discount / 100.00)
            "After the discount, the total comes to $#{new_total.to_i}."
        else
            "There is no discount to apply."
        end
    end
    
    def items
        @item_list
    end

    def void_last_transaction
        if @cost_list.size == 0
            @total = 0.0
        else
            @total -= @cost_list.pop * quantity_list.pop
        end
    end
end