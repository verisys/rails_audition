class WelcomeController < ApplicationController
  def index
    puts " "
    puts "********* Current User ********"
    p current_user
    puts "*************************"
    puts " "
    @user = current_user
  end
end
