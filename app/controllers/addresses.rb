#creates new address(es)

get '/contacts/:id/addresses/new' do
  @contact = Contact.find(params[:id])
  @address = Address.new
  erb :'addresses/new'
  end

post '/contacts/:id/addresses' do
  @contact = Contact.find(params[:id])
  @address = @contact.addresses.create(params[:address])
  erb :'contacts/show'
end

# ---------------------------------------- #
# edit/delete address(es)

get '/contacts/:id/addresses/:od/edit' do
  @contact = Contact.find(params[:id])
  @address = Address.find(params[:od])
  erb :'addresses/edit'
end

post '/contacts/:id/addresses/:od' do
  @contact = Contact.find(params[:id])
  found_address = Address.find(params[:od])
  @address = found_address.update(params[:address])
  erb :'contacts/show'
end

post '/contacts/:id/addresses/:od/delete' do
  @contact = Contact.find(params[:id])
  @address = Address.find(params[:od])
  @address.destroy
  redirect "/contacts/#{@contact.id}"
end
