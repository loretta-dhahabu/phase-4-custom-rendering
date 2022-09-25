class CheesesController < ApplicationController

  # GET /cheeses
  def index
    cheeses = Cheese.all

    #built-in serialization options
    #example 1
    render json: cheeses, only: [:id, :name, :price, :is_best_seller]

  end

  # GET /cheeses/:id
  def show
    cheese = Cheese.find_by(id: params[:id])
    #example 2
    #Basic Error Messaging When Rendering JSON Data
    if cheese
    render json: cheese,  except: [:created_at, :updated_at], methods: [:summary]
    else
      render json: {error: "Cheese not found"}, status: :not_found
    end
  end

end
