class MembersController < ApplicationController
before_filter :require_no_member, :only => [:new, :create]
before_filter :require_member, :only => [:show,  :edit, :update]
before_filter :require_member_admin, :only => [:destroy]
    def new
    @member = Member.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @member }
    end
  end
  def create
  @member = Member.new(params[:member])
  if @member.save
    flash[:notice] =  "Registration successful."
    redirect_to root_url
  else
    render :action => 'new'
   end
 end
 
 def edit
  @member = current_member
 end

def update
  @member = current_member
  if @member.update_attributes(params[:member])
    flash[:notice] = "Successfully updated profile."
    redirect_to (@member) 
  else
    render :action => 'edit'
  end
 end


  # GET /members
  # GET /members.xml
  def index
    @members = Member.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @members }
    end
  end

  # GET /members/1
  # GET /members/1.xml
  def show
    @member = Member.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @member }
    end
  end

  # GET /members/new
  # GET /members/new.xml


  # GET /members/1/edit
#  def edit
 #   @member = Member.find(params[:id])
 # end

  # POST /members
  # POST /members.xml
#  def create
#    @member = Member.new(params[:member])

#    respond_to do |format|
#      if @member.save
#        flash[:notice] = 'Member was successfully created.'
#        format.html { redirect_to(@member) }
#        format.xml  { render :xml => @member, :status => :created, :location => @member }
#      else
#        format.html { render :action => "new" }
#        format.xml  { render :xml => @member.errors, :status => :unprocessable_entity }
#      end
#    end
 # end

  # PUT /members/1
  # PUT /members/1.xml
#  def update
#    @member = Member.find(params[:id])
#
#    respond_to do |format|
#      if @member.update_attributes(params[:member])
#        flash[:notice] = 'Member was successfully updated.'
#        format.html { redirect_to(@member) }
#        format.xml  { head :ok }
#      else
#        format.html { render :action => "edit" }
#        format.xml  { render :xml => @member.errors, :status => :unprocessable_entity }
#      end
#    end
 # end

  # DELETE /members/1
  # DELETE /members/1.xml
  def destroy
    @member = Member.find(params[:id])
    @member.destroy

    respond_to do |format|
      format.html { redirect_to(members_url) }
      format.xml  { head :ok }
    end
  end
end
