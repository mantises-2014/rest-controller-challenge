
get '/contacts/:id/addresses/new' do
#   @address = Address.new
#   erb :"addresses/new"
# end

# # CREATE
# post '/addresses' do
  @contact = Contact.find(params[:id])
  @address = @contact.addresses.build
    erb :'/addresses/new'
end

post '/contacts/:id/addresses' do
  @contact = Contact.find(params[:id])
  @address = Address.new(params[:address])
  @address.contact_id = @contact.id
  @address.save
  erb :'contacts/show'
end

# EDIT
get '/contacts/:id/addresses/:address_id/edit' do
  @contact = Contact.find(params[:id])
  @address = Address.find(params[:address_id])
  erb :'addresses/edit'
end

# UPDATE
put '/contacts/:id/addresses/:address_id' do
  @contact = Contact.find(params[:id])
  @address = Address.find(params[:address_id])
  @address.contact_id = @contact.id
  @address.update_attributes(params[:address])

  # redirect "/contacts/#{@contact.id}/addresses/#{@address.id}"
  erb :'contacts/show'
end

# get '/contacts/:id/addresses/:address_id' do
#   @contact = Contact.find(params[:id])
#   @address = Address.find(params[:address_id])

#   erb :'contacts/show'
# end
