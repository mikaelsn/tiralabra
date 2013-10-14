require 'benchmark'
include Benchmark
require 'bigdecimal/math'

class SortsController < ApplicationController
  before_action :set_sort, only: [:show, :edit, :update, :destroy]

  # GET /sorts
  # GET /sorts.json
  def index
    @sort = Sort.new
    @sort.bubble = Sort.average('bubble')
    @sort.quick = Sort.average('quick')
    @sort.merge = Sort.average('merge')
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
    @sort.name = params[:name]
    @sort.input = params[:input]

    list = populate(params[:name], params[:input])
    org = list
    p org

    mergeList = list
    quickList = list

    p "Mergelist before: #{mergeList}"
    merge = Benchmark.realtime do 
      mergeList = Sort.merge_sort(mergeList)
    end
    p "Mergelist after: #{mergeList}"

    p "Quick before: #{quickList}"
    quick = Benchmark.realtime do 
      quickList = Sort.quick_sort(quickList)
    end
    p "Quick after: #{quickList}"

    p "Bubble before: #{list}"
    bubble = Benchmark.realtime do 
      list = Sort.bubble(list)
    end
    p "Bubble after: #{list}"
    #convert to milliseconds
    @sort.quick = quick*1000
    @sort.bubble = bubble*1000
    @sort.merge = merge*1000

    respond_to do |format|
      if @sort.save
        format.html { redirect_to @sort, notice: "Quicksort: #{quick*1000}ms, Mersort: #{merge*1000}ms, Bubblesort: #{bubble*1000}ms" }
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

    def populate(cond, inp)
      if cond == 'random'
        (0..inp.to_i).to_a.sort{ rand() - 0.5 }[0..inp.to_i]
      end
      if cond == 'desc'
        Array.new(inp.to_i) { |i| (inp.to_i)-i }
      end
      if cond == 'asc'
        Array.new(inp.to_i) { |i| i }
      end
    end

end
