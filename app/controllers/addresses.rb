get '/contacts/:id/addresses/new' do
  @address = Address.new
  @contact = Contact.find(params[:id])
  erb :"addresses/new"
end

post '/contacts/:id/addresses' do
  new_address = Address.create(params[:address])
  @contact = Contact.find(params[:id])
  @contact.addresses << new_address
  erb :'contacts/show'
end

get '/contacts/:id/addresses/:address_id/edit' do
  @address = Address.find(params[:address_id])
  @contact = Contact.find(params[:id])
  erb :"addresses/edit"
end

post '/contacts/:id/addresses/:address_id' do
  Address.update(params[:address_id], params[:address])
  @address = Address.find(params[:address_id])
  @contact = Contact.find(params[:id])
  erb :"contacts/show"
end
