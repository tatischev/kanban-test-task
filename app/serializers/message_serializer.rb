class MessageSerializer < ActiveModel::Serializer
  attributes :id, :conversation_id, :position, :board_id, :list_id
end
