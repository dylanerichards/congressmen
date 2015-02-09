class PagesController < ApplicationController

  def home
    if user_signed_in?
      Congress.key = '0ef8e130fe124b69a2388d253fd05e63'

      @house_rep = current_user.house_rep
      @senator1 = current_user.senator1
      @senator2 = current_user.senator2
    end
  end
end
