class HealthsController < ApplicationController
  def check
    render plain: 'ok'
  end
end