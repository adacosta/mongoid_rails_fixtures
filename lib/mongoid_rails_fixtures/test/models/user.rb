class User
  include Mongoid::Document

  field :username
  field :is_active, :type => Boolean
  field :roles, :type => Array
  
  validates_presence_of :username
  validates_uniqueness_of :username
end