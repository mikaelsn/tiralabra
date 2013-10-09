require 'benchmark'
include Benchmark
require 'bigdecimal/math'

class SortsController < ApplicationController
  before_action :set_sort, only: [:show, :edit, :update, :destroy]

  # GET /sorts
  # GET /sorts.json
  def index
    @sort = Sort.new
  end

  # GET /sorts/1
  # GET /sorts/1.json
  def show
    @sort = Sort.find(params[:id])
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
    @sort.name = params[:name]
    @sort.input = params[:input]

    # if params[:name] == 'random'
    #   list = (0..params[:input].to_i).to_a.sort{ rand() - 0.5 }[0..params[:input].to_i]
    # else
    #   list = Array.new(params[:input].to_i) { |i| (params[:input].to_i)-i }
    #   p list
    # end
    list = populate(params[:name])
    p list
    mergeList = list
    quickList = list

    merge = Benchmark.realtime do 
      mergeList = Sort.merge_sort(mergeList)
    end
    p mergeList

    quick = Benchmark.realtime do 
      quickList = Sort.quick_sort(quickList)
    end
    p quickList

    bubble = Benchmark.realtime do 
      list = Sort.bubble(list)
    end

    @sort.quick = quick
    @sort.bubble = bubble
    @sort.merge = merge

    respond_to do |format|
      if @sort.save
        format.html { redirect_to @sort, notice: "Bubble #{bubble*1000}ms, Quick #{quick*1000}ms, Merge #{merge*1000}ms" }
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
      params.fetch(:sort, {}).permit(:name, :input) 
    end

    def populate(cond)
      if cond == 'random'
        (0..params[:input].to_i).to_a.sort{ rand() - 0.5 }[0..params[:input].to_i]
      else
        Array.new(params[:input].to_i) { |i| (params[:input].to_i)-i }
      end
    end
end
