require 'rails_helper'

RSpec.describe Book, type: :model do
  it "is valid with name" do
    book = Book.new(
        id: 1,
        author: "ken",
        name: "test"
    )
    expect(book).to be_valid
  end

  it "is invalid without name" do
    book = Book.new(
        name: nil,
    )
    book.valid?
    expect(book.errors[:name]).to include("can't be blank")
  end
end
