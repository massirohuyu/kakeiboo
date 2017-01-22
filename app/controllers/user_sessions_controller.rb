class UserSessionsController < ApplicationController
  layout 'simple'

  def new
    @user = User.new
  end

  def create(user)
    if @user = login(user[:uid], user[:password])
      redirect_back_or_to :root, notice: 'ログインしました'
    else
      @user = User.new
      flash.now[:alert] = 'ログインできませんでした'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to :root, notice: 'ログアウトしました'
  end
end
