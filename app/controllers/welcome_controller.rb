class WelcomeController < ApplicationController

  def index
    @user = User.new
  end

  def show
    binding.pry
    redirect_to root_path
  end

end
