class MainController < ApplicationController
  def index
    @contact = Contact.last
  end
end
