class HomeController < ApplicationController
  def index
    @response = Faraday.get 'https://api.bitso.com/v3/available_books'
    # conn = Faraday.new(:url => 'https://api.bitso.com/v3')
    # response = conn.get '/available_books'

    # render json:@response.body


  end
end
