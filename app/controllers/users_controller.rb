class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin
  def index
    @users = User.all
  end
end
