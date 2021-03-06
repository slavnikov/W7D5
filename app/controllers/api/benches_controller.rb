class Api::BenchesController < ApplicationController
  def create
    @bench = Bench.new(bench_params)

    if @bench.save
      render :show
    else
      render json: @bench.errors.full_messages, status: 422
    end
  end

  def index
    @benches = Bench.in_bounds(params[:bounds])

    render :index
  end

  def show
    @bench = Bench.find_by(id: params[:id])

    render :show
  end

  private

  def bench_params
    params.require(:bench).permit(:description, :lat, :lng)
  end
end
