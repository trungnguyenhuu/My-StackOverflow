class VotesController < ApplicationController
        before_action :authenticate_user!
        before_action :find_commentable, only: [:new, :create, :edit, :update, :destroy]
        before_action :set_question_for_go_back, only: [:new, :create, :edit, :update, :destroy]
        before_action :find_comment, only: [:edit, :update, :destroy]
        before_action :check_comment_with_user_and_commentable, only: [:edit, :update, :destroy]
        



        def up
        end

        def down
        end

        private 

                def find_commentable 
                        # byebug
                        if params[:question_id]
                                begin
                                        @commentable = Question.find(params[:question_id])
                                rescue
                                        redirect_to root_path, alert: "You can not do this"
                                end
                                return
                        end
                        if params[:answer_id]
                                begin
                                        @commentable = Answer.find(params[:answer_id])
                                rescue
                                        redirect_to root_path, alert: "You can not do this"
                                end
                                return
                        end
                end

                def set_question_for_go_back
                        #set question for redirect to it
                        if @commentable.class == Answer
                                @question = @commentable.question
                        else
                                @question = @commentable
                        end
                end


                def find_comment
                        @comment = Comment.find(params[:id])
                end

                def check_comment_with_user_and_commentable
                        if @comment.user != current_user || @comment.commentable != @commentable
                                redirect_to root_path
                        end
                end



end
