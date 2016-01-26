class MessageSerializer < ActiveModel::Serializer
  attributes :message_id, :date, :from, :to, :subject, :type1, :type2, :body1, :body2
end
