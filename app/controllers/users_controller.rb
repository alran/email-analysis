class UsersController < ApplicationController

  def show
    @user = User.find_by(id: params[:id]).to_json
    @analyses = Analysis.where(user_id: params[:id]).to_json
  end

end
