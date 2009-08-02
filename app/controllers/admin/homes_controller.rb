class Admin::HomesController < ApplicationController
  before_filter :authenticate
  layout 'publications'
def index


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
     end
     flash.now[:message]="CSV Import Successful,  #{n} new

                                records added to data base"
   end
end
  def authenticate
    authenticate_or_request_with_http_basic do |user, pass|
      #User.authenticate(name, pass)
      user == 'akita' && pass == 'akita'      
    end
  end
 end
end

