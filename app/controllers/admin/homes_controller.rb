class Admin::HomesController < ApplicationController
  before_filter :authenticate
  layout 'publications'
def index

end


  def authenticate
    authenticate_or_request_with_http_basic do |user, pass|
      #User.authenticate(name, pass)
      user == 'akita' && pass == 'akita'      
    end
  end
end


