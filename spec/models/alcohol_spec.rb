require 'rails_helper'

RSpec.describe Alcohol, type: :model do
  it "is valid with valid attributes" do
    user =  User.create(username: "luke", password: "qwfp1", password_confirmation: "qwfp1")
    alcohol = Alcohol.create(name: 'test', volume_in_ml: 0, critical_volume: 0, user: user)
    expect(alcohol).to be_valid
  end
  
  it "is valid without a volume_in_ml" do
    user =  User.create(username: "luke", password: "qwfp1", password_confirmation: "qwfp1")
    alcohol = Alcohol.create(name: 'test', critical_volume: 0, user: user)
    expect(alcohol).to be_valid
  end
  
  it "is valid without a critical volume" do
    user =  User.create(username: "luke", password: "qwfp1", password_confirmation: "qwfp1")
    alcohol = Alcohol.create(name: 'test', volume_in_ml: 0, user: user)
    expect(alcohol).to be_valid
  end

  it "is not valid without a name" do
    user =  User.new(username: "luke", password: "qwfp1", password_confirmation: "qwfp1")
    alcohol = Alcohol.create(volume_in_ml: 0, critical_volume: 0, user: user)
    expect(alcohol).to_not be_valid
  end

  it "is not valid without a user" do
    user =  User.create(username: "luke", password: "qwfp1", password_confirmation: "qwfp1")
    alcohol = Alcohol.create(name: 'test', critical_volume: 0)
    expect(alcohol).to_not be_valid
  end
end
