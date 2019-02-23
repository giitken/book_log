class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to root_path, notice: "蔵書の登録が完了しました"
    else
      flash.now[:notice] = "蔵書の登録が失敗しました。もう一度やり直してください。"
      render :new
    end
  end

  def edit
  end

  def update
  end

  private

  def book_params
    params.require(:book).permit(:name, :author, :memo)
  end

end
