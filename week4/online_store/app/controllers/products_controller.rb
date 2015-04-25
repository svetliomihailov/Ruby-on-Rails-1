class ProductsController < BaseController
  def index
    render_json Product.all
  end

  def count
    render_count Product
  end

  def show
    render_json Product.find(params[:id])
  end

  def create
    p = Product.new(
      name: params[:product][:name],
      price: BigDecimal.new(params[:product][:price]),
      quantity: params[:product][:quantity],
      category: Category.find_by_name(params[:product][:category]),
      brand: Brand.find_by_name(params[:product][:brand])
    )
    p.save!

    render_created
  end

  def range
    render_json Product.with_offset(params[:index])
  end

  def range_count
    render_json Product.with_offset(params[:index]).take(params[:count])
  end

  def destroy
    Product.find(params[:id]).destroy

    render_ok
  end
end