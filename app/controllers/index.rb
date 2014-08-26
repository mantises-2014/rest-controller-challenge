get '/contacts/:contact_id' do
  @contact = Contact.find(params[:contact_id])
  erb :"contacts/show"
end

get '/contacts/:contact_id/addresses/new' do
  @contact = Contact.find(params[:contact_id])
  @address = @contact.addresses[0]
  erb :"addresses/new"
end

post '/contacts/:contact_id/addresses' do
  @contact = Contact.find(params[:contact_id])
  @address = Address.create(contact_id: @contact.id, street: params[:address][:street], state: params[:address][:state], city: params[:address][:city], zip: params[:address][:zip])
  redirect "/contacts/#{@contact.id}"
end
get "/contacts/:contact_id/addresses/:address_id/edit" do
  @contact = Contact.find(params[:contact_id])
  @address = Address.find(params[:address_id])
  erb :"addresses/edit"
end
