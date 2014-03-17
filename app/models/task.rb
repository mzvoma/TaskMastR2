class Task < ActiveRecord::Base

  belongs_to :project

  validates :name, :due, presence: true



end
