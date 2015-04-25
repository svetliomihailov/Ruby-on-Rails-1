class BaseController < ApplicationController
  rescue_from StandardError do |e|
    render_json({error: e.message, status: 500})
  end

  def render_json(object)
    render json: object
  end

  def render_count(model)
    render_json count: model.count
  end

  def render_ok
    render_json status: :ok
  end

  def render_created
    head :created
  end
end