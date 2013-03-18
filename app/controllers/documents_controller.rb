class DocumentsController < ApplicationController

  def new
    @document = Document.new
  end

  def create
    @document = Document.new(params[:document])
    @document.folder_id = @document[:folder_id]
    if @document.save
      redirect_to :root, notice: 'Good job, your document was saved!'
    else
      render :new
    end
  end
end
