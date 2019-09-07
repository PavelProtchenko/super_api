class User
  include Mongoid::Document
  include Mongoid::Timestamps
  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String

  validates_presence_of :email

  def self.pagination(number)
    ids = pluck(:id)
    @users = []
    sliced_array = ids.each_slice(25).to_a.unshift([])
    sliced_array[number].each do |el|
      @users << find(el)
    end
    @users
  end
end
