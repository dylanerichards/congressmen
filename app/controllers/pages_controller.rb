class PagesController < ApplicationController

  def home
    if user_signed_in? 
    	Congress.key = '0ef8e130fe124b69a2388d253fd05e63'
    	legislators = Congress.legislators_locate(current_user.zip)["results"]
    	@house_rep = legislators.select{|leg| leg.chamber == "house"}[0]
    	@senator1 = legislators.select{|leg| leg.chamber == "senate"}[0]
    	@senator2 = legislators.select{|leg| leg.chamber == "senate"}[1]
    end
  end

  def about
  end

  def contact
  end
end