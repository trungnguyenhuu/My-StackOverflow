class Question < ActiveRecord::Base
        belongs_to :user
        has_many :answers
        has_many :comments, as: :commentable

        validates :title, presence: true, length: {in: 5..255}
        validates :content, presence: true, length: {in: 5..1000}
end
