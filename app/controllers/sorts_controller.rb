require 'benchmark'
include Benchmark
require 'bigdecimal/math'

class SortsController < ApplicationController
  before_action :set_sort, only: [:show, :edit, :update, :destroy]

  # GET /sorts
  # GET /sorts.json
  def index
    @sorts = Sort.all
    
    list = [9, 0, 45, 3, 6, 7, 20, 19, 5]
    p list
    bubble = Benchmark.realtime do 
      list = Sort.bubble(list)
    end
    p list 
    p "Took #{bubble*1000}ms"
  end

  # GET /sorts/1
  # GET /sorts/1.json
  def show
  end

  # GET /sorts/new
  def new
    @sort = Sort.new
  end

  # GET /sorts/1/edit
  def edit
  end

  # POST /sorts
  # POST /sorts.json
  def create
    @sort = Sort.new(sort_params)

    respond_to do |format|
      if @sort.save
        format.html { redirect_to @sort, notice: 'Sort was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sort }
      else
        format.html { render action: 'new' }
        format.json { render json: @sort.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sorts/1
  # PATCH/PUT /sorts/1.json
  def update
    respond_to do |format|
      if @sort.update(sort_params)
        format.html { redirect_to @sort, notice: 'Sort was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sort.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sorts/1
  # DELETE /sorts/1.json
  def destroy
    @sort.destroy
    respond_to do |format|
      format.html { redirect_to sorts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sort
      @sort = Sort.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sort_params
      params.require(:sort).permit(:name, :runtime, :input)
    end
end
