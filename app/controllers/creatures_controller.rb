class CreaturesController < ApplicationController

  #display all creatures
  def index
    #get all creatures from db and save to instance variable
    @creatures = Creature.all

    # render the index view (it has access to instance variable)

    render :index
  end

  def new
    @creature = Creature.new
    render :new
  end

  def create
    creature_params =

    creature = Creature.new(creature_params)

    if creature.save
      redirect_to "/creatures/#{creature.id}"
    end
  end


  def show

    creature_id = params[:id]

    @creature = Creature.find_by_id(creature_id)

    render :show
  end


  # show the edit creature form
  def edit
    # get the creature id from the url params
    creature_id = params[:id]

    # use `creature_id` to find the creature in the database
    # and save it to an instance variable
    @creature = Creature.find_by_id(creature_id)

    # render the edit view (it has access to instance variable)
    render :edit
  end


  def update

    creature_id = params[:id]

    creature = Creature.find_by_id(creature_id)

    creature_params = get_creature_params

    creature.update_attributes(creature_params)

    redirect_to "/creatures/#{creature.id}"

  end


  def destroy

    creature_id = params[:id]

    creature = Creature.find_by_id(creature_id)

    creature.destroy

    redirect_to "/creatures"

  end

  private

  def get_creature_params
    params.require(:creature).permit(:name, :description)
  end
end
