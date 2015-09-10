class HousesController < ApplicationController
	skip_before_action :verify_authenticity_token
	
	#Static routes
	def find_us 
	end

	def about 
	end

	def contact 
	end

	#RESTful routes

	#Index
	def index
		@houses = House.all
	end

	#New
	def new
		@house = House.new
	end

	#Show
	def show
		@house = House.find(params[:id])
		redirect_to("/houses/:id")
	end

	#Create
	def create
		@house = House.new(city: params[:house]['city'], country: params[:house]['country'], image: params[:house]['image'], price: params[:house]['price'])
    if @house.save
      redirect_to("/houses/#{@house[:id]}")
    else
      redirect_to("/houses/edit")
    end
	end

	# /#{@house.id}/show

	#Update
	def update
		@house = House.find(params[:id])
		if @house.update_attributes(params[:id])
			redirect_to("/houses/#{@house.id}")
		else
			redirect_to("/houses/edit")
		end
	end

	#Edit
	def edit
		@house = House.find(params[:id])
		redirect_to("/houses")
	end

	#Delete
	def destroy
		@house = House.find(params[:id])
		if @house.destroy
			redirect_to("/houses")
		else
			redirect_to("/houses/#{@house.id}")
		end
	end


end