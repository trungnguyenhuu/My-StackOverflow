class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :comments, as: :commentable

  validates :content, presence: true, length: {in: 5..1000}
end
