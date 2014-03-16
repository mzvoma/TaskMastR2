class Membership < ActiveRecord::Base

  belongs_to :user
  belongs_to :project

  validates_uniqueness_of :user_id, :scope => :project_id, :message => 'is already on that project'

end
