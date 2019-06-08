class CommandSerializer < ActiveModel::Serializer
  attributes :id, :key, :value, :user_id
end
