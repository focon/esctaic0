class PublicationsController < ApplicationController

  # GET /publications
  # GET /public1ations.xml

     def index
  @publications = Publication.paginate :per_page => 5, :page => params[:page],
                                       :order => 'title'
   end 

  # GET /publications
  # GET /publications.xml
  def index1
    @publications = Publication.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @publications }
    end
  end

  # GET /publications/1
  # GET /publications/1.xml
  def show
    @publication = Publication.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @publication }
    end
  end


 
end