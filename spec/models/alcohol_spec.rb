require 'rails_helper'
# require './alcohol'

RSpec.describe Alcohol, type: :model do
  it "is valid with valid attributes" do
    expect(Alcohol.new).to be_valid
  end
  it "is not valid without a name"
  it "is not valid without a critical volume"
  it "is not valid without a user"
end
