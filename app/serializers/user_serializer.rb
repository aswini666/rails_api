class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :city, :email, :tags
  has_many :tags
end
