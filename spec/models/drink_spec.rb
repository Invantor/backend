require 'rails_helper'

RSpec.describe Drink, type: :model do
  it "is valid with valid attributes" do
    user =  User.create(username: "luke", password: "qwfp1", password_confirmation: "qwfp1")
    alcohol = Alcohol.create(name: 'test', volume_in_ml: 0, critical_volume: 0, user: user)
    mixer = Mixer.create(name: 'test', volume_in_ml: 0, critical_volume: 0, user: user)
    drink = Drink.create(alcohol: alcohol, mixer: mixer, name: 'test', user_id: user.id)
    expect(drink).to be_valid
  end
  
  it "is not valid without user" do
    user =  User.new(username: "luke", password: "qwfp1", password_confirmation: "qwfp1")
    alcohol = Alcohol.new(name: 'test', volume_in_ml: 0, critical_volume: 0, user: user)
    mixer = Mixer.new(name: 'test', volume_in_ml: 0, critical_volume: 0, user: user)
    drink = Drink.new(alcohol: alcohol, mixer: mixer, name: 'test')
    expect(drink).to be_valid
  end

  it "is not valid without user" do
    alcohol = Alcohol.new(name: 'test', volume_in_ml: 0, critical_volume: 0)
    drink = Drink.new(alcohol: alcohol, name: 'test')
    expect(drink).to_not be_valid
  end
  
  it "is not valid without alcohol" do
    user =  User.new(username: "luke", password: "qwfp1", password_confirmation: "qwfp1")
    mixer = Mixer.new(name: 'test', volume_in_ml: 0, critical_volume: 0)
    drink = Drink.new( mixer: mixer, name: 'test')
    expect(drink).to_not be_valid
  end

  it "is not valid without mixer" do
    user =  User.new(username: "luke", password: "qwfp1", password_confirmation: "qwfp1")
    alcohol = Alcohol.new(name: 'test', volume_in_ml: 0, critical_volume: 0)
    drink = Drink.new(alcohol: alcohol, name: 'test')
    expect(drink).to_not be_valid
  end

end