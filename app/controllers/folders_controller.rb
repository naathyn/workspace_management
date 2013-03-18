class FoldersController < ApplicationController

  def index
    @directories  = Directory.all
    @folders      = Folder.all
    @documents    = Document.all
    @directory    = Directory.new
    @folder       = Folder.new
    @document     = Document.new
    @document_array    = @documents.map { |doc|
      [doc.title, doc.content]
    }
    @search = @folders.map(&:name) << @directories.map(&:name) << @document_array
    @search.flatten!.to_json
  end

  def new
    @folder = Folder.new
  end

  def create
    @folder = Folder.new(params[:folder])
    @folder.directory_id = @folder[:directory_id] if @folder[:directory_id]
    @folder.subfolder_id = @folder[:subfolder_id] if @folder[:subfolder_id]
    if @folder.save
      redirect_to :root, notice: 'Folder was successfully created, now fill it!'
    else
      render :new
    end
  end
end
