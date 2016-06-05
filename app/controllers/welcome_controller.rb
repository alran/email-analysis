class WelcomeController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index]

  def index
    @user = User.new
  end

  def show
    binding.pry
    redirect_to root_path
  end

end
