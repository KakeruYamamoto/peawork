# このコードをコピペしてrubyファイルに貼り付け、そのファイルをirbでrequireして実行しましょう。

# 例

# irb
# require '/Users/shibatadaiki/work_shiba/full_stack/sample.rb'
# （↑のパスは、自動販売機ファイルが入っているパスを指定する）
require '/Users/yamamotoshou/workspace/pea_work/VendingMachine.rb'

# 初期設定（自動販売機インスタンスを作成して、vmという変数に代入する）
# vm = VendingMachine.new

# 作成した自動販売機に100円を入れる
# vm.slot_money (100)

# 作成した自動販売機に入れたお金がいくらかを確認する（表示する）
# vm.current_slot_money

# 作成した自動販売機に入れたお金を返してもらう
# vm.return_money

class Vm
    # ステップ０お金の投入と払い戻しの例コード
    # ステップ１扱えないお金の例コード

    # 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
    MONEY = [10, 50, 100, 500, 1000].freeze
    attr_accessor :carts
    # （自動販売機に投入された金額をインスタンス変数の @slot_money に代入する）
    def initialize
      # 最初の自動販売機に入っている金額は0円
      @slot_money = 0
      @carts = Drink.new

    end

    # 投入金額の総計を取得できる。
    def current_slot_money
      # 自動販売機に入っているお金を表示する
      @slot_money
    end

    # 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
    # 投入は複数回できる。
    def slot_money(money)
      # 想定外のもの（１円玉や５円玉。千円札以外のお札、そもそもお金じゃないもの（数字以外のもの）など）
      # が投入された場合は、投入金額に加算せず、それをそのまま釣り銭としてユーザに出力する。
      if MONEY.include?(money)
      # 自動販売機にお金を入れる
        @slot_money += money
        nil
      else
        money
      end
    end

    # 払い戻し操作を行うと、投入金額の総計を釣り銭として出力する。
    def return_money
      slot_money = @slot_money
      # 自動販売機に入っているお金を0円に戻す
      @slot_money = 0
      # 返すお金の金額を表示する
      slot_money
    end
  end

  class Drink

    def coke
      coke = {price:120,name:"コーラ"}

      coke
      end
    end

    def redbull
      redbull = [200,"レッドブル"]
      redbull
    end

    def water
      water = [100,"水"]
      water
    end
  end

  # class Stocks
  #   stoks = []
  #   @drink1 = Drink.new.coke
  #
  #
  #   def coke_stock
  #     n = @drink1.map { |d| d * 5}
  #       stocks << n
  #       stocks
  #   end
  # end
  class Stocks
     #@stoks = []
     #@drink1 = Drink.new.coke


     def coke_stock
       stoks = []
       @drink1 = Drink.new.coke
       n = @drink1.map { |d| d * 5}
          n

         end
   end
