class HomeController < ApplicationController
   
  # before_action :authenticate_user!

  def index
    @provider_details = ProviderDetail.where(email_confirmed: true).paginate(page: params[:page], per_page: 3)
    @categories= Category.all
    respond_to do |format|
      format.html
      format.js
     end
  end

  def msg
    @conversation = Conversation.get(current_user.id, params[:user_id])
    Conversation.read_message(@conversation.id, current_user.id)
    add_to_conversations
  end

  def reminder
    reminder = WorkList.new(title: params[:title], description: params[:description], date: params[:date], provider_id: current_user.provider.id, category_id: params[:category_id])
    if reminder.save
      redirect_to user_path(current_user), notice: 'Reminder is successfully added.' 
    else 
      redirect_to user_path(current_user), notice: 'Reminder is failed to add.'
    end
  end

  def reminder_status
    reminder = WorkList.find(params[:id])
    if reminder.update(status: true)
      redirect_to user_path(current_user), notice: 'Reminder\'s status is successfully updated.'
    else
      redirect_to user_path(current_user), notice: 'Reminder\'s status is failed to updated.'
    end
  end
 
  def delete_reminder
      reminder= WorkList.find(params[:format])
      if reminder.destroy
        redirect_to user_path(current_user), notice: 'Reminder is successfully deleted.' 
      else 
        redirect_to user_path(current_user), notice: 'Reminder is failed to delete.'
      end
  end

  def find_provider_by_category
    category_id = Category.find(params[:format])
    @provider_details= ProviderDetail.where(category_id: category_id.id)
  end
  
  def find_provider_for_city
    category_id = Category.find_by(name: params[:search_input].capitalize)
    @provider_details= params[:city] != "" ? ProviderDetail.where(category_id: category_id.id, city: params[:city]) : ProviderDetail.where(category_id: category_id.id)
  end

  def filter_for_cities
    @provider_details= ProviderDetail.where(city: params[:city])
    render json: { provider_detail:render_to_string('home/_provider_details', layout:false, locals: { provider_details: @provider_details }) }
  end

  private

  def add_to_conversations
    session[:conversations] = @conversation.id
  end
  
end
