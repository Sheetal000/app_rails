class BooksController < ApplicationController
  # layout "inventory"

  def index
    @book = Book.all
  end

  def show
    @book = Book.find_by(id: params[:id])
    if @book.nil?
      @book = Book.all
      flash.now[:alert] = "your book was not found"
      render "index"
    end
    # render json: @book
    # render layout: false
    # render status: 500
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to(@book)
    else
      render "edit"
    end
  end
  
end
