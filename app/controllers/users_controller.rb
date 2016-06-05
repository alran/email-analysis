class UsersController < ApplicationController

  def show
    @user = User.find_by(id: params[:id])
    @analyses = Analysis.where(user_id: params[:id])
  end

end
