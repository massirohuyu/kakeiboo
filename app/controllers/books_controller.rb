class BooksController < ApplicationController
  before_action :set_book, only: :show

  # GET /books
  def index
    @books = current_user.books.all
  end

  # GET /books/1
  def show
    @entry = @book.entries.new(input_user: current_user)
  end

  private
    def set_book
      @book = current_user.books.find(params[:id])
    end
end
