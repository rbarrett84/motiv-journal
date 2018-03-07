class EntriesController < ApplicationController
  before_action :authorize_user?

  def index
    @entries = Entry.all
  end

  def new
    @prompt = Prompt.all.rand
  end

  def create
     # = Superpower.find(params[:superpower_id])
    parsed_entry = JSON.parse(request.body.read)
    entry = Entry.new(response: parsed_entry["response"], prompt_id: parsed_entry[prompt_id])
    entry.user = current_user
    # entry.superpower = superpower

    if current_user.nil?
      render status: 401
    elsif entry.save
      flash[:notice] = 'Entry Added Successfully'
      redirect_to: entries_path
    else
      flash[:alert] = entry.errors.full_messages.join(", ")
    end

  end

  private

  def authorize_user?
    if !user_signed_in?
      redirect_to new_user_registration_path
    end
  end
end
