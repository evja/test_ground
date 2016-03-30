class Link < ActiveRecord::Base
  default_scope -> { order(votes: :desc) }
  belongs_to :user, dependent: :destroy
  has_many :comments

  validates :user_id,      :presence => true
  validates :title,        :presence => true

end
