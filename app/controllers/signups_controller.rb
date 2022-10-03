class SignupsController < ApplicationController

def create
new_sign=Signup.new(signup_params)

if new_sign.valid?
new_sign.save
render json:new_sign.activity,status: :created
else
    render :json => { :errors => new_sign.errors.full_messages },status: :unprocessable_entity

end


end

private

def signup_params
    params.permit(:camper_id,:activity_id,:time)

end

end
