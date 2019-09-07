class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :email, :updated_at

  def count
    User.pluck(:id).count
  end
end
