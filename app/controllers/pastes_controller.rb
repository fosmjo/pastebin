class PastesController < ApplicationController
  def create
    attrs = {
      shortlink: Paste.gen_shortlink(request.remote_ip)
    }
    if params[:expiry_in_minutes].present?
      attrs[:expired_at] = Time.now + params[:expiry_in_minutes].to_i.minutes
    end

    paste = Paste.new(attrs)
    paste.content = params[:content]
    paste.save!
    render json: { shortlink: paste.shortlink }
  end

  def show
    paste = Paste.find(params[:shortlink])
    render plain: paste.content
  end
end
