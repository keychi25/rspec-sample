require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with a name, text, password and sex' do
    user = User.new(
      name: 'hogehoge',
      text: 'test',
      password: 'password',
      sex: '男性'
    )
    expect(user).to be_valid
  end

  it 'is invalid without a name' do
    user = User.new(
      name: '',
      text: 'test',
      password: 'password',
      sex: '男性'
    )
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it 'is invalid a password' do
    a = 'a'
    user = User.new(
      name: 'hogehoge',
      text: 'test',
      password: a * 7,
      sex: '男性'
    )
    user.valid?
    expect(user.errors[:password]).to include('is too short (minimum is 8 characters)')
  end
end
