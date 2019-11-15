

require '/Users/yamamotoshou/workspace/pea_work/kokudo.rb'



class VendingMachine

  MONEY = [10, 50, 100, 500, 1000].freeze
  #0-1.10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。

  def initialize
    @slot_money = 0
    @proceeds = 0
    item = Item.new
    @stock = [item.coke, item.redbull, item.water]
  end


  def current_slot_money#0-3.投入金額の総計を取得できる。
    @slot_money
  end

#0-2.投入は複数回できる。
#1-1.想定外のもの（硬貨：１円玉、５円玉。お札：千円札以外のお札）が投入された場合は、投入金額に加算せず、それをそのまま釣り銭としてユーザに出力する。
  def slot_money(money)
    if MONEY.include?(money)
      @slot_money += money
      self.can_purchase_list
      nil
    else
      money
    end
  end


#0-4.払い戻し操作を行うと、投入金額の総計を釣り銭として出力する。
  def return_money
    slot_money = @slot_money
    @slot_money = 0
    slot_money
  end

#4-4.投入金額、在庫の点で購入可能なドリンクのリストを取得できる。
#3-1 投入金額、在庫の点で、コーラが購入できるかどうかを取得できる。
  def can_purchase_list
    @can_purchase = []
    @stock.each {|stock|
      #@stock = [item.coke, item.redbull, item.water]
      if stock != [] && @slot_money >= (stock[0][:price]).to_i
        @can_purchase << stock
      else
        @can_purchase << []
      end
    }
  end

  #5-2.ジュースと投入金額が同じ場合、つまり、釣り銭0円の場合も、釣り銭0円と出力する。
  # 5-1.ジュース値段以上の投入金額が投入されている条件下で購入操作を行うと、釣り銭（投入金額とジュース値段の差分）を出力する。
  #3-5.払い戻し操作では現在の投入金額からジュース購入金額を引いた釣り銭を出力する。
  #3-3.投入金額が足りない場合もしくは在庫がない場合、購入操作を行っても何もしない。
  #3-2.ジュース値段以上の投入金額が投入されている条件下で購入操作を行うと、ジュースの在庫を減らし、売り上げ金額を増やす。

  def purchase(x)
    if @can_purchase[x] != [] #空配列ではない場合、trueの処理
      @slot_money -= (@can_purchase[x][0][:price]).to_i
      @proceeds += (@can_purchase[x][0][:price]).to_i
      @stock[x].shift
      self.return_money
    else

    end
  end

  def current_proceeds#3-4.現在の売上金額を取得できる。
    @proceeds
  end
end


#2-2 2.格納されているジュースの情報（値段と名前と在庫）を取得できる。
class Stocks
  def stock_info(menu_price, menu_name, number)
  end
end

#4-1,2,3.ジュースを3種類管理できるようにする。/2.在庫にレッドブル（値段:200円、名前”レッドブル”）5本を追加する。/3.在庫に水（値段:100円、名前”水”）5本を追加する。
#2-1 1.値段と名前の属性からなるジュースを１種類格納できる。初期状態で、コーラ（値段:120円、名前”コーラ”）を5本格納している。
class Item
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

v = VendingMachine.new
s = Stocks.new
i = Item.new





v = VendingMachine.new
s = Stocks.new
i = Item.new




#  v.slot_money()
#
# v.slot_money(500)
#
# v.current_slot_money
#
#  v.can_purchase_list
