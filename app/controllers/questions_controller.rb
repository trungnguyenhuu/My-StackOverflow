class QuestionsController < ApplicationController

        before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
        before_action :find_question, only: [:show, :edit, :update, :destroy]
        before_action :check_question_with_user, only: [:edit, :destroy]

        def index
                @questions = Question.includes(:user).all
        end

        def show
        end

        def new
                @question = Question.new
        end

        def create
                @question = Question.new question_params
                @question.user = current_user
                if @question.save
                        redirect_to @question
                else
                        render :new
                end
        end

        def edit
        end

        def update
               if @question.update(question_params)
                       redirect_to @question, notice: "update question successfully"
               else
                       render :edit
               end
        end

        #can coi lai
        def destroy
                @question.destroy
                redirect_to profile_path
        end


        def question_params
                params.require(:question).permit(:title, :content)
        end
        def find_question
                @question = Question.find(params[:id])
        end

        def check_question_with_user
                if @question.user != current_user
                        redirect_to root_path
                end
        end
end
