class Vote < ActiveRecord::Base
        belongs_to :user
        belongs_to :votable, polymorphic: true

        # validates :vote_up, presence: true
end
