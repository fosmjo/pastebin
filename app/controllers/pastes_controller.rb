class PastesController < ApplicationController
  def index
    pastes = current_user.pastes
    render json: pastes
  end

  def create
    attrs = {
      shortlink: Paste.gen_shortlink(request.remote_ip),
      user_id: current_user.id
    }
    if params[:expiry_in_minutes].present?
      attrs[:expired_at] = Time.now + params[:expiry_in_minutes].to_i.minutes
    end

    paste = Paste.new(attrs)
    paste.content = params[:content]
    if paste.save
      render json: { shortlink: paste.shortlink }
    else
      render json: { errors: paste.errors }
    end
  end

  def show
    paste = Paste.find(params[:shortlink])
    render plain: paste.content
  end
end
