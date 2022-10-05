require "prawn"
class ClientsController < ApplicationController 
  def index
    @clients = Client.all
  end

  def show
     @client = Client.find(params[:id])
     respond_to do |format|
       format.html
       format.pdf do 
          render pdf: Prawn::Document.new do 
            text "name: John doe",align: :center
            text "Phone: 442333222"
            text "city: jaipur"
          end
      end
    end
  end

  def download_pdf
    client = Client.find(params[:client_id])
    send_data generate_pdf(client),
    filename: "#{client.name}.pdf",
    type: "application/pdf"
  end

  private
  
  def generate_pdf(client)
    Prawn::Document.new do 
      text client.name,align: :center
      text "Phone: #{client.phone}"
      text "city: #{client.city}"
    end.render
  end
end


