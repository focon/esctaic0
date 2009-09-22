class Admin::PublicationsController < ApplicationController
 before_filter :authenticate
  # GET /publications
  # GET /publications.xml
  
  
       def index
  @publications = Publication.paginate :per_page => 5, :page => params[:page],
                                       :order => 'title'
   end 
  
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

  # GET /publications/new
  # GET /publications/new.xml
  def new
    @publication = Publication.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @publication }
    end
  end

  # GET /publications/1/edit
  def edit
    @publication = Publication.find(params[:id])
  end

  # POST /publications
  # POST /publications.xml
  def create
    @publication = Publication.new(params[:publication])

    respond_to do |format|
      if @publication.save
        flash[:notice] = 'Publication was successfully created.'
        format.html { redirect_to([:admin, @publication]) }
        format.xml  { render :xml => @publication, :status => :created, :location => @publication }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @publication.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /publications/1
  # PUT /publications/1.xml
  def update
    @publication = Publication.find(params[:id])

    respond_to do |format|
      if @publication.update_attributes(params[:publication])
        flash[:notice] = 'Publication was successfully updated.'
        format.html { redirect_to([:admin, @publication]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @publication.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /publications/1
  # DELETE /publications/1.xml
  def destroy
    @publication = Publication.find(params[:id])
    @publication.destroy

    respond_to do |format|
      format.html { redirect_to(admin_publications_url) }
      format.xml  { head :ok }
    end
  end

def confirm_destroy
  @publication = Publication.find(params[:id])
end
    require 'csv'

def csv_import 
     @parsed_file=CSV::Reader.parse(params[:dump][:file])
     n=0
     @parsed_file.each  do |row|
     c=Publication.new
     
     c.url=row[1]
     c.title=row[2]
     c.author=row[3]
     c.venue=row[4]
     c.year=row[5]
     c.category=row[6]
     if c.save
        n=n+1
        GC.start if n%50==0
     
     
 
     flash.now[:message]="CSV Import Successful,  #{n} new records added to data base #{@template.link_to('publication', @publications)}"
                      
   end
end
end

  def authenticate
    authenticate_or_request_with_http_basic do |user, pass|
      #User.authenticate(name, pass)
      user == 'akita' && pass == 'akita'      
    end
  end

end
