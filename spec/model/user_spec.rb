require 'rails_helper'
RSpec.describe User, type: :model do
  it 'is valid with a name, nickname, email, and password' do
    @user = User.new(
      name: 'kimu',
      nickname: 'kkk',
      email: 'kimu@kimu.com',
      password: 'gaia0683'
    )
    expect(@user).to be_valid
  end
  it 'is invalid without a name' do
    @user = User.new(
      name: nil
    )
    expect(@user.valid?).to eq(false)
  end
  it 'is invalid without a nickname' do
    @user = User.new(
      nickname: nil
    )
    expect(@user.valid?).to eq(false)
  end
  it 'is invalid without a email' do
    @user = User.new(
      email: nil
    )
    expect(@user.valid?).to eq(false)
  end
  it 'is invalid without a password' do
    @user = User.new(
      password: nil
    )
    expect(@user.valid?).to eq(false)
  end
  it 'is invalid with a duplicate email' do
    User.create(
      name: 'kimu',
      nickname: 'kkk',
      email: 'kimu@kimu.com',
      password: 'gaia0683'
    )
    @user = User.new(
      name: 'bomu',
      nickname: 'bbb',
      email: 'kimu@kimu.com',
      password: 'gaia0683'
    )
    expect(@user.valid?).to eq(false)
  end
  it 'is invalid with a duplicate name' do
    User.create(
      name: 'kimu',
      nickname: 'kkk',
      email: 'kimu@kimu.com',
      password: 'gaia0683'
    )
    @user = User.new(
      name: 'kimu',
      nickname: 'bbb',
      email: 'bomu@bomu.com',
      password: 'gaia0683'
    )
    expect(@user.valid?).to eq(false)
  end
  it 'is invalid with a duplicate nickname' do
    User.create(
      name: 'kimu',
      nickname: 'kkk',
      email: 'kimu@kimu.com',
      password: 'gaia0683'
    )
    @user = User.new(
      name: 'bomu',
      nickname: 'kkk',
      email: 'bomu@bomu.com',
      password: 'gaia0683'
    )
    expect(@user.valid?).to eq(false)
  end
end
