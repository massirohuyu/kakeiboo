class UserSessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create(user)
    if @user = login(user[:uid], user[:password])
      redirect_back_or_to :root, notice: 'ログインしました'
    else
      flash.now[:alert] = 'ログインできませんでした'
      render action: 'new'
    end
  end
end
