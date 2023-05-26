class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin, except: [:show]
  def index
    @users = User.all
  end

  def show
    @user = current_user
  end
end
