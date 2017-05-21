class HomeController < ApplicationController
  def index
    @response_available_books = Faraday.get 'https://api.bitso.com/v3/available_books'
    @response_ticker = Faraday.get 'https://api.bitso.com/v3/ticker/'

    # hardcoded params until conn is working!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    @response_book_btc = Faraday.get 'https://api.bitso.com/v3/order_book?book=btc_mxn&aggregate=true'
    @response_trades_btc = Faraday.get 'https://api.bitso.com/v3/trades?book=btc_mxn&sort=desc&limit=100'




    # render json:@response.body
     @all = JSON.parse(@response_available_books.body)
     @fx = []
     @minimum_price = []
     @minimum_amount = []
     @maximum_price = []
     @maximum_amount = []
     @payload = @all["payload"]
     @payload.each do |x|
      @fx << x["book"]
       @minimum_price << x["minimum_price"]
       @minimum_amount << x["minimum_amount"]
       @maximum_price << x["maximum_price"]
       @maximum_amount << x["maximum_amount"]
    end


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
       @last << y["last"]
       @low << y["low"]
       @average << y["vwap"]
       @ask << y["ask"]
       @bid << y["bid"]
     end



     @book_btc = JSON.parse(@response_book_btc.body)
     @bids_prices = []
     @asks_prices = []
    #  Uncomment if needed
    #  @bids_amounts = []
    #  @asks_amounts = []
     @payload_book = @book_btc["payload"]
     @updated = @payload_book["updated_at"]
     @bids = @payload_book["bids"]
     @bids.each do |y|
       @bids_prices.push(y["price"])
     end
     @asks = @payload_book["asks"]
     @asks.each do |y|
       @asks_prices.push(y["price"])
     end


     @trades_btc = JSON.parse(@response_trades_btc.body)
     @fz = []
     @date = []
     @amount = []
     @side = []
     @price = []
     @maker_side = []
     @trade_id = []
     @payload_trades = @trades_btc["payload"]
     @payload_trades.each do |y|
       @fz << y["book"]
       @date << y["created_at"]
       @amount << y["amount"]
       @maker_side << y["maker_side"]
       @price << y["price"]
       @trade_id << y["tid"]
     end


  end
end
