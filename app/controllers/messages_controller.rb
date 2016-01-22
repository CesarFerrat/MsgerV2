class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
      new_message = Hash.new

      new_message[:message_id] = params['id']
      new_message[:from] = params['payload']['headers'][2]['value']
      new_message[:to] = params['payload']['headers'][3]['value']
      new_message[:date] = params['payload']['headers'][1]['value']
      new_message[:subject] = params['payload']['headers'][5]['value']
      new_message[:body] = params['payload']['parts'][0]['body']['data']

      final_message = Message.create(new_message)

      render :json => new_message, status: 201
  end

  def show
    message = Message.find_by(:message_id => params[:id].to_s)
    render :json => message.as_json(except:[:id, :created_at, :updated_at])
  end
end
