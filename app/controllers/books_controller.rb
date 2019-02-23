class BooksController < ApplicationController
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
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to root_url, notice: "蔵書の更新が完了しました。"
    else
      flash.now[:notice] = "蔵書の更新が失敗しました。もう一度やり直してください。"
      render :edit
    end
  end

  private

  def book_params
    params.require(:book).permit(:name, :author, :memo)
  end

end
