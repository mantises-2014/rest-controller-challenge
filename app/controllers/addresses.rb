get '/contacts/:id/addresses/new' do
  @contact = Contact.find(params[:id])
  @address = Address.new
  erb :'addresses/new'
end

get '/contacts/:id/addresses/:address_id/edit' do
  @contact = Contact.find(params[:id])
  @address = Address.find(params[:address_id])
  erb :'addresses/edit'
end

post '/contacts/:id/addresses' do
  @contact = Contact.find(params[:id])
  @contact.addresses.create(params[:address])
  redirect "/contacts/#{@contact.id}"
end

post '/contacts/:id/addresses/:address_id' do
  @contact = Contact.find(params[:id])
  @address = Address.find(params[:address_id])
  @address.update(params[:address])
  redirect "/contacts/#{@contact.id}"
end

