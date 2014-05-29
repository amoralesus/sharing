class AddSharingJoiningTable < ActiveRecord::Migration
  def change
    create_table :projects_users, :index => false do |t|
      t.integer :project_id
      t.integer :user_id
    end
  end
end
