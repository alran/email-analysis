class UsersController < ApplicationController

  def show
    user = User.find_by(id: params[:id])
    @user = user.to_json
    @image = user.google_oauth2.image.to_json
    @company = Company.find_by(id: user.company_id).to_json
    @analyses = Analysis.where(user_id: params[:id]).to_json
  end

end
