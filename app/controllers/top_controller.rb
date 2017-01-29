class TopController < ApplicationController
  skip_before_action :require_login

  def index
    if logged_in?
      book = current_user.books.first
      redirect_to book
    else
      redirect_to :login
    end
  end
end