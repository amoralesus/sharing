class User < ActiveRecord::Base
  validates_presence_of :email, :full_name
  validates_uniqueness_of :email

  has_secure_password

  has_many :projects

  has_and_belongs_to_many :shared_projects, :class_name => "Project", :foreign_key => :user_id, :association_foreign_key => :project_id

  has_many :followings
  has_many :followers, :class_name => "User", :through => :followings

  has_many :inverse_followings, :foreign_key => :follower_id, :class_name => "Following"
  has_many :following, :through => :inverse_followings, :source => :user

  def follow(other_user)
    Following.create(:user_id => other_user.id, :follower_id => self.id)
  end

  def visible_projects
    projects.to_a + shared_projects.to_a
  end
end
