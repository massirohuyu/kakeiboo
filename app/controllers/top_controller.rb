class TopController < ApplicationController
  skip_before_action :require_login

  def index
    if logged_in?
      redirect_to :entries
    else
      redirect_to :login
    end
  end
end