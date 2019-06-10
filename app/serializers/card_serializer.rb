# app/serializers/card_serializer.rb
class CardSerializer < ActiveModel::Serializer
  attributes :id, :title, :position, :board_id, :list_id
end
