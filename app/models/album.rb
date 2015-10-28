class Album < ActiveRecord::Base
  has_many :medium
  belongs_to :user
end
