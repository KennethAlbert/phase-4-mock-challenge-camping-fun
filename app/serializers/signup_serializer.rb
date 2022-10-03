class SignupSerializer < ActiveModel::Serializer
  attributes :id,:activity_id,:camper_id
  belongs_to :activity
end
