class SignupsController < ApplicationController

def create
new_sign=Signup.new(signup_params)

if signup_params.valid?
new_sign.save

render json:new_sign,status: :created
end


end

private

def signup_params
    params.permit(:camper_id,:activity_id,:time)

end

end
