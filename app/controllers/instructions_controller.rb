class InstructionsController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @instruction = @recipe.instructions.new
    render :new
  end

  def create 
    @recipe = Recipe.find(params[:recipe_id])
    @instruction = @recipe.instructions.new(instruction_params)
    if @instruction.save
      render "recipes/show"
    else 
      flash[:notice] = "error step was not saved"
      render :new
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @instruction = Instruction.find(params[:id])
    render :show
  end 

  def update
    @recipe = Recipe.find(params[:recipe_id])
    @instruction = Instruction.find(params[:id])
    if @instruction.update(instruction_params)
      flash[:notice] = "Instructions Successfully Updated!"
      render "recipes/show"
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @instruction = Instruction.find(params[:id])
    render :edit
  end

  def destroy
    @instruction = Instruction.find(params[:id])
    @instruction.destroy
    flash[:notice] = "This instruction was successfully deleted!"
    redirect to "recipe/show"
  end

  private
  def instruction_params
    params.require(:instruction).permit(:steps)
  end
end