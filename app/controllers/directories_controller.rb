class DirectoriesController < ApplicationController

  def new
    @directory = Directory.new
  end

  def create
    @directory = Directory.new(params[:directory])
    if @directory.save
      redirect_to :root, notice: 'Directory was successfully created, now fill it up!'
    else
      render :new
    end
  end
end
