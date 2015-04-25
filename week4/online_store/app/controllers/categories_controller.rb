class CategoriesController < BaseController
  def index
    render_json Category.all
  end

  def count
    render_count Category
  end

  def show
    render_json Category.find(params[:id])
  end

  def create
    c = Category.new name: params[:category][:name]
    c.save!

    render_created
  end

  def range
    render_json Category.with_offset(params[:index])
  end

  def range_count
    render_json Category.with_offset(params[:index]).take(params[:count])
  end

  def destroy
    Category.find(params[:id]).destroy

    render_ok
  end
end