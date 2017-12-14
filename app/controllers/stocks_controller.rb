class StocksController < ApplicationController
  
  def search
    if params[:stock].blank?
      @stock = Stock.new_from_lookup(params[:stock])
      if @stock
     else
        flash.now[:danger] = "You have entered an incorrect symbol"
      end
    else
      flash.now[:danger] = "You have entered an empty search string"
    end
    render partial: 'users/result'
  end

end