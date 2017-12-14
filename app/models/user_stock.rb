class UserStock < ActiveRecord::Base
  belongs_to :user
  belongs_to :stock
    
  def destroy
    stock = Stock.find(params[:id])
    @user_stock = UserStock.where(user_id: current_user.id, stock_id: stock.id).first
    @user_stock.destroy
    flash[:notice] = "Stock was successfully removed from portfolio"
    redirect_to my_portfolio_path
  end

end
