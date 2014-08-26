get '/contacts/:id/addresses/new' do
  @contact = Contact.find(params[:id])
  @address = Address.new

  erb :"addresses/new"
end

post '/contacts/:id/addresses' do
  @contact = Contact.find(params[:id])
  @address = Address.new(params[:address])
  @address.update_attributes(contact: @contact)
  @address.save

  redirect to "/contacts/#{params[:id]}"
end

get '/contacts/:id/addresses/:address_id/edit' do
  @contact = Contact.find(params[:id])

  @address = Address.find(params[:id])

  erb :"addresses/edit"
end

put '/contacts/:id/addresses/:address_id' do
  @address = Address.find(params[:id])
  @address.update_attributes(params[:address])

  redirect to "/contacts/#{params[:id]}"
end




