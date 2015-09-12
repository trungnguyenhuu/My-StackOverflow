class AnswersController < ApplicationController

        before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
        before_action :find_question_to_answer, only: [:new, :create, :edit, :update, :destroy]
        before_action :find_answer, only: [:edit, :update, :destroy]

        def new
                @answer = Answer.new
        end

        def create
                @answer = Answer.new answer_params
                @answer.user = current_user
                @answer.question = @question
                if @answer.save
                        redirect_to question_path(@question), notice: "Answer question successfully"
                else
                        render :new
                end
        end

        def edit
        end

        def update
                if @answer.update(answer_params)
                        redirect_to question_path(@question), notice: "Update answer successfully"
                else
                        render :edit
                end
        end


        def destroy
                @answer.destroy
                redirect_to question_path(@question), notice: "Delete answer successfully"
        end


        def answer_params
                params.require(:answer).permit(:content)
        end

        def find_question_to_answer
                begin
                        @question = Question.find(params[:question_id])
                rescue
                        redirect_to root_path
                end
        end

        def find_answer
                begin
                        @answer = Answer.find(params[:id])
                        if @answer.user != current_user || @answer.question != @question
                                redirect_to root_path, alert: "You can not edit this answer"
                        end
                rescue
                        redirect_to root_path
                end
        end
end
