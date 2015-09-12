class CustomUsersController < ApplicationController
        before_action :authenticate_user!, only: [:profile]

        def profile
                @questions = current_user.questions
        end
end
