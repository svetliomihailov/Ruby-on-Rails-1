class BrandsController < BaseController
  def index
    render_json Brand.all
  end

  def count
    render_count Brand
  end

  def show
    render_json Brand.find(params[:id])
  end

  def create
    b = Brand.new name: params[:brand][:name], description: params[:brand][:description]
    b.save!

    render_created
  end

  def range
<<<<<<< HEAD
    # render_json Brand.find_each(start: params[:index])
=======
>>>>>>> Week 4 solutions
    render_json Brand.with_offset(params[:index])
  end

  def range_count
    render_json Brand.with_offset(params[:index]).take(params[:count])
  end

  def destroy
    Brand.find(params[:id]).destroy

    render_ok
  end
end