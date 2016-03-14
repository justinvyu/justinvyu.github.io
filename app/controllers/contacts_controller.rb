class ContactsController < ApplicationController
    def new
        @contact = Contact.new
    end

    def create
        @contact = Contact.new(params[:contact])
        @contact.request = request
        if @contact.deliver
            flash[:notice] = 'Your email has been sent.'
            # flash.now[:error] = 'Email has been sent.'
            redirect_to root_path
        else
            flash[:alert] = 'Could not send message.'
            render :new
        end
    end
end
