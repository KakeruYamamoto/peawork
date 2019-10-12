
class Vm

  def initialize
    @slot_money = 0

     item = Item.new
     @stock = [item.coke,item.redbull,item.water]
   end


   def can_purchase_list1
     #@can_purchase = []
     @stock.map {|stock|
       puts stock
     }


   end

end

class Item　#2-1 1.値段と名前の属性からなるジュースを１種類格納できる。初期状態で、コーラ（値段:120円、名前”コーラ”）を5本格納している。
  def coke
    stock = Stocks.new.stock_info(120, "coke", 5)
  end

  def redbull
    stock = Stocks.new.stock_info(200, "Red Bull", 5)
  end

  def water
    stock = Stocks.new.stock_info(100, "water", 5)
  end
end


v = Vm.new

p v.can_purchase_list1
