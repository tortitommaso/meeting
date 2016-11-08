require 'singleton'

class UserRepository
 include Singleton

  def initialize
    @users = []
    @users << User.new(name: "Tommaso")
    @users << User.new(name: "Mario")
    @deleted_users = []
  end

  def all
    @users
  end

  def deleted_users
    @deleted_users
  end

  def add user
    @users << user
  end

  def remove name
    @users.delete_if {|user| user.name == name}
    @deleted_users << OpenStruct.new(name: name, date: Time.zone.now)
  end

  def reset
    @users = []
    @deleted_users = []
  end

end