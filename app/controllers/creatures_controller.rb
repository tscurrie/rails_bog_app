class CreaturesController < ApplicationController

	def index
		@creatures = Creature.all
		render :index
	end

	def new 
		@creature = Creature.new
		render :new
	end
	# create a new creature in the database
	def create
	#whitelist params  and save them to a variable
	  creature_params = params.require(:creature).permit(:name, :description)

	  # create a new creature from 'creature_params'
	  creature = Creature.new(creature_params)

	  # if creature svaes, redirect to route taht displays all creatures
	  if creature.save
	  	redirect_to creature_path(creature)
	  end
	 end

	 # display a specific creature
	 def show 
	 	# get the creature id from the url params
	 	creature_id = params[:id]

	 	#use 'creature_id' to find the creature in the database
	 	# and save it to an instance variable
	 	@creature = Creature.find_by_id(creature_id)

	 	#render the show view (it has access to instance variable)
	 	render :show
	 end



end
