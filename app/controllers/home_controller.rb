class HomeController < ApplicationController
  def index
    @response_ticker = Faraday.get 'https://api.bitso.com/v3/ticker/'


    @all_ticker = JSON.parse(@response_ticker.body)
    @fy = []
    @volume = []
    @high = []
    @last = []
    @low = []
    @average = []
    @ask = []
    @bid = []
    @payload_ticker = @all_ticker["payload"]
    @payload_ticker.each do |y|
      @fy << y["book"]
      @volume << y["volume"]
      @high << y["high"]
      @last << y["last"].to_f
      @low << y["low"]
      @average << y["vwap"]
      @ask << y["ask"]
      @bid << y["bid"]
    end


    @array = ["btc_eth","eth_btc","xrp_btc","btc_xrp","xrp_eth","eth_xrp"]
    @mega_array1 = []
    @mega_array2 = []
    @array.each do |x|
        @res = Faraday.get "https://shapeshift.io/rate/#{x}"
        @res1 = JSON.parse(@res.body)
        @name = @res1["pair"]
        @rate = @res1["rate"]
        @mega_array1 << @name
        @mega_array2 << @rate.to_f
    end



    # @ss_btc_eth = Faraday.get 'https://shapeshift.io/rate/btc_eth'
    #
    # @btc_eth = JSON.parse(@ss_btc_eth.body)
    # @btc_eth_name = @btc_eth["pair"]
    # @btc_eth_price = @btc_eth["rate"]




















    # @ss_eth_btc = Faraday.get 'https://shapeshift.io/rate/eth_btc'
    # @ss_btc_xrp = Faraday.get 'https://shapeshift.io/rate/btc_xrp'
    # @ss_xrp_btc = Faraday.get 'https://shapeshift.io/rate/xrp_btc'




    # @response_available_books = Faraday.get 'https://api.bitso.com/v3/available_books'
    #
    # # hardcoded params until conn is working!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    # @response_book_btc = Faraday.get 'https://api.bitso.com/v3/order_book?book=btc_mxn&aggregate=true'
    # @response_trades_btc = Faraday.get 'https://api.bitso.com/v3/trades?book=btc_mxn&sort=desc&limit=10'
    #
    # @response_book_eth = Faraday.get 'https://api.bitso.com/v3/order_book?book=eth_mxn&aggregate=true'
    # @response_trades_eth = Faraday.get 'https://api.bitso.com/v3/trades?book=eth_mxn&sort=desc&limit=10'
    #
    # @response_book_xrp = Faraday.get 'https://api.bitso.com/v3/order_book?book=xrp_mxn&aggregate=true'
    # @response_trades_xrp = Faraday.get 'https://api.bitso.com/v3/trades?book=xrp_mxn&sort=desc&limit=10'


    # render json:@response.body
    #  @all = JSON.parse(@response_available_books.body)
    #  @fx = []
    #  @minimum_price = []
    #  @minimum_amount = []
    #  @maximum_price = []
    #  @maximum_amount = []
    #  @payload = @all["payload"]
    #  @payload.each do |x|
    #   @fx << x["book"]
    #    @minimum_price << x["minimum_price"]
    #    @minimum_amount << x["minimum_amount"]
    #    @maximum_price << x["maximum_price"]
    #    @maximum_amount << x["maximum_amount"]
    # end



    #
    #
    #  @book_btc = JSON.parse(@response_book_btc.body)
    #  @bids_prices_btc = []
    #  @asks_prices_btc = []
    # #  Uncomment if needed
    # #  @bids_amounts = []
    # #  @asks_amounts = []
    #  @payload_book_btc = @book_btc["payload"]
    #  @updated_btc = @payload_book_btc["updated_at"]
    #  @bids_btc = @payload_book_btc["bids"]
    #  @bids_btc.each do |y|
    #    @bids_prices_btc.push(y["price"])
    #  end
    #  @asks_btc = @payload_book_btc["asks"]
    #  @asks_btc.each do |y|
    #    @asks_prices_btc.push(y["price"])
    #  end
    #
    #
    #  @trades_btc = JSON.parse(@response_trades_btc.body)
    #  @fx_btc = []
    #  @date_btc = []
    #  @amount_btc = []
    #  @side_btc = []
    #  @price_btc = []
    #  @maker_side_btc = []
    #  @trade_id_btc = []
    #  @payload_trades_btc = @trades_btc["payload"]
    #  @payload_trades_btc.each do |y|
    #    @fx_btc << y["book"]
    #    @date_btc << y["created_at"]
    #    @amount_btc << y["amount"]
    #    @maker_side_btc << y["maker_side"]
    #    @price_btc << y["price"]
    #    @trade_id_btc << y["tid"]
    # end
    #
    #
    #
    #
    #  @book_eth = JSON.parse(@response_book_eth.body)
    #  @bids_prices_eth = []
    #  @asks_prices_eth = []
    # #  Uncomment if needed
    # #  @bids_amounts = []
    # #  @asks_amounts = []
    #  @payload_book_eth = @book_eth["payload"]
    #  @updated_eth = @payload_book_eth["updated_at"]
    #  @bids_eth = @payload_book_eth["bids"]
    #  @bids_eth.each do |y|
    #    @bids_prices_eth.push(y["price"])
    #  end
    #  @asks_eth = @payload_book_eth["asks"]
    #  @asks_eth.each do |y|
    #    @asks_prices_eth.push(y["price"])
    #  end
    #
    #
    #  @trades_eth = JSON.parse(@response_trades_eth.body)
    #  @fx_eth = []
    #  @date_eth = []
    #  @amount_eth = []
    #  @side_eth = []
    #  @price_eth = []
    #  @maker_side_eth = []
    #  @trade_id_eth = []
    #  @payload_trades_eth = @trades_eth["payload"]
    #  @payload_trades_eth.each do |y|
    #    @fx_eth << y["book"]
    #    @date_eth << y["created_at"]
    #    @amount_eth << y["amount"]
    #    @maker_side_eth << y["maker_side"]
    #    @price_eth << y["price"]
    #    @trade_id_eth << y["tid"]
    # end
    #
    #
    #
    #  @book_xrp = JSON.parse(@response_book_xrp.body)
    #  @bids_prices_xrp = []
    #  @asks_prices_xrp = []
    # #  Uncomment if needed
    # #  @bids_amounts = []
    # #  @asks_amounts = []
    #  @payload_book_xrp = @book_xrp["payload"]
    #  @updated_xrp = @payload_book_xrp["updated_at"]
    #  @bids_xrp = @payload_book_xrp["bids"]
    #  @bids_xrp.each do |y|
    #    @bids_prices_xrp.push(y["price"])
    #  end
    #  @asks_xrp = @payload_book_xrp["asks"]
    #  @asks_xrp.each do |y|
    #    @asks_prices_xrp.push(y["price"])
    #  end
    #
    #
    #  @trades_xrp = JSON.parse(@response_trades_xrp.body)
    #  @fx_xrp = []
    #  @date_xrp = []
    #  @amount_xrp = []
    #  @side_xrp = []
    #  @price_xrp = []
    #  @maker_side_xrp = []
    #  @trade_id_xrp = []
    #  @payload_trades_xrp = @trades_xrp["payload"]
    #  @payload_trades_xrp.each do |y|
    #    @fx_xrp << y["book"]
    #    @date_xrp << y["created_at"]
    #    @amount_xrp << y["amount"]
    #    @maker_side_xrp << y["maker_side"]
    #    @price_xrp << y["price"]
    #    @trade_id_xrp << y["tid"]
    # end





# DLETE
    # def trade_algorithm
    #   @funds = 10000
    #   @last_purchase = 41603.02
    #   if @price_btc.first.to_i < @last_purchase
    #     puts "Buy 5% of funds"
    #     puts @price_btc.first.to_i
    #     puts @last_purchase
    #   elsif
    #     puts @price_btc.first.to_i
    #     puts @last_purchase
    #     puts "Don't buy"
    #   end
    # end
    #
    # Thread.new do
    #   while true do
    #     trade_algorithm
    #     sleep 1
    #   end
    # end





  end
end
