class WelcomeController < ApplicationController
  def homepage
    def new
      @contact = Contact.new
    end

    def create
      @contact = Contact.new(params[:contact])
      @contact.request = request
      if @contact.deliver
        flash.now[:error] = nil
        flash.now[:notice] = 'Gracias por to mensaje!'
      else
        flash.now[:error] = 'No se pudo mandar tu mensaje.'
        render :new
      end
    end
  end
end
