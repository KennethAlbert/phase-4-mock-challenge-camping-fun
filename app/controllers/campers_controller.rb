class CampersController < ApplicationController
    def index
        campers=Camper.all
        render json:campers,status: :ok
    end

    def show
    camper=Camper.find_by(id: params[:id])
    if camper
    render json: camper,serializer: ActivityCamperSerializer,status: :ok
    else
     render json:{error:"Camper not found"},status: :not_found
    end
    end

    def create
    newCamper=Camper.new(camper_params)

    if newCamper.valid?
    newCamper.save
    render json:Camper.last,status: :created
    else
        render :json => { :errors => newCamper.errors.full_messages },status: :unprocessable_entity
    end

    end

    private
  def camper_params
 params.permit(:name,:age)

 end

end
