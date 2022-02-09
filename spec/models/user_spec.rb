require 'rails_helper'
# require './app/models'

RSpec.describe User, type: :model do
  it "is valid with valid attributes" do
    # alcohol = build(:alcohol)
    user = User.create(username: "luke", password: "qwfp1", password_confirmation: "qwfp1")
    expect(user).to be_valid
  end

  it "is not valid without a name" do
    user = User.create(password: "qwfp1", password_confirmation: "qwfp1")
    expect(user).to be_invalid
  end
  
  # it "is not valid without a user"



end

