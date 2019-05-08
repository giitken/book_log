class BooksController < ApplicationController

  before_action :set_book, only: [:edit, :update]

  def index
    @q = Book.ransack(params[:q])
    @books = @q.result(distinct: true)
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
    if @book.update(book_params)
      redirect_to root_url, notice: "蔵書の更新が完了しました。"
    else
      flash.now[:notice] = "蔵書の更新が失敗しました。もう一度やり直してください。"
      render :edit
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:name, :author, :memo)
  end

end
