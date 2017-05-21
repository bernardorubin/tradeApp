class HomeController < ApplicationController
  def index
    @response = Faraday.get 'https://api.bitso.com/v3/available_books'
    @response_ticker = Faraday.get 'https://api.bitso.com/v3/ticker/'
    # conn = Faraday.new(:url => 'https://api.bitso.com/v3')
    # response = conn.get '/available_books'

    # render json:@response.body
     @all = JSON.parse(@response.body)
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
  end
end
