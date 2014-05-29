class Project < ActiveRecord::Base

  validates_presence_of :name
  belongs_to :user
  has_and_belongs_to_many :users

  def share_with(other_user)
    self.users << other_user
  end
end
