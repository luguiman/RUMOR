class BreakfastsController < ApplicationController
  before_action :set_breakfast, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @breakfasts = Breakfast.all
  end

  def show
  end

  def new
    @breakfast = Breakfast.new
    @menus = Menu.all
  end

  def edit
  end

  def create
    @breakfast = Breakfast.new(breakfast_params)
      if @breakfast.save
        @menu = Menu.find(@breakfast.menu_id)
        redirect_to @menu, notice: 'Desjejum criado com sucesso'
      else
        render :new, locals: { :menu_id => :menu_id }
      end
  end

  def update
      if @breakfast.update(breakfast_params)
        @menu = Menu.find(@breakfast.menu_id)
        redirect_to @menu, notice: 'Desjejum atualizado com sucesso.'
      else
        render :edit, locals: { :menu_id => :menu_id }
      end
  end

  def destroy
    begin
      @breakfast.destroy
      flash[:notice] = 'Desjejum excluido com sucesso'
      redirect_to breakfasts_url
    end
  end

  private
    def set_breakfast
      @breakfast = Breakfast.find(params[:id])
    end

    def breakfast_params
      params.require(:breakfast).permit(:menu_id, :hot_drinks, :vegetarian_drink, :chocolate_milk, :bread, :vegetarian_bread, :margarine, :vegetarian_margarine, :complement, :vegetarian_complement, :fruit)
    end
end