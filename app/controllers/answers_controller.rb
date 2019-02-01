class AnswersController < ApplicationController
  before_action :set_question, only: [:create]
  before_action :set_qanda, only: [:update,:edit,:destroy]
  
  def create
    @answer = Answer.new
    if @answer.update(answer_params)
      redirect_to question_path(@question), notice: 'Success!'
    else
      redirect_to question_path(@question), alert: 'Invalid!'
    end
  end
  
  def edit
  end
  
  def update
    if @answer.update(answer_params)
      redirect_to question_path(@question), notice: 'Success!'
    else
      flash[:alert] = "Invalid!"
      render :edit
    end
  end
  
  def destroy
    @answer.destroy
    redirect_to question_path(@question), notice: 'Deleted!'
  end
  
  
  private
  
  def set_question
    @question = Question.find(params[:question_id])
  end
  
  def set_qanda
    set_question
    @answer = @question.answers.find(params[:id])
  end
  
  def answer_params
    params.require(:answer).permit(:content, :name, :question_id)
  end
  
end
