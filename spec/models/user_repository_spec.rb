require 'rails_helper'

RSpec.describe UserRepository do

  before(:all) do
    UserRepository.instance.reset
    user_repository = UserRepository.instance
    expect(user_repository.all.size).to eq(0)
    expect(user_repository.deleted_users.size).to eq(0)
  end

  it "should add and remove users" do
    user_repository = UserRepository.instance
    a_user = User.new(name: "Tom")
    user_repository.add(a_user)
    expect(user_repository.all.size).to eq(1)
    expect(user_repository.deleted_users.size).to eq(0)
    user_repository.remove(a_user.name)
    expect(user_repository.all.size).to eq(0)
    expect(user_repository.deleted_users.size).to eq(1)
  end

  it "deleted_user should contains name and date" do
    user_repository = UserRepository.instance
    a_user = User.new(name: "Tom")
    user_repository.add(a_user)
    user_repository.remove(a_user.name)
    actual = user_repository.deleted_users.first
    expect(actual.name).to eq("Tom")
    expect(actual.date).not_to be_nil
  end

end