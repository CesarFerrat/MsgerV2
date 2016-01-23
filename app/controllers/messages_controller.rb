class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
      new_message = Hash.new

      new_message[:message_id] = params['id']

      params['payload']['headers'].each do |data|
        if data['name'] == "Date"
            new_message[:date] = data['value']
        elsif data['name'] == "From"
            new_message[:from] = data['value']
        elsif data['name'] == "To"
            new_message[:to] = data['value']
        elsif data['name'] == "Subject"
            new_message[:subject] = data['value']
        end
      end

      type = []
      body = []
      params['payload']['parts'].each do |data|
          type << data['mimeType']
          body << data['body']['data']
      end

      new_message[:type1] = type[0]
      new_message[:type2] = type[1]
      new_message[:body1] = body[0]
      new_message[:body2] = body[1]
      final_message = Message.create(new_message)

      render :json => new_message, status: 201
  end

  def show
    message = Message.find_by(:message_id => params[:id].to_s)
    render :json => message.as_json(except:[:id, :created_at, :updated_at])
  end
end
