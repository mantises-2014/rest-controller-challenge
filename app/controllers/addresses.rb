# get "/contacts/:id" do
# 	@contact = Contact.find(params[:id])
# 	erb :'contacts/show'
# end

get '/contacts/:id/addresses/new' do
	@contact = Contact.find(params[:id])
	@address = Address.new
	erb :'addresses/new'
end

# Edit page
get '/contacts/:contact_id/addresses/:address_id/edit' do
	@contact = Contact.find(params[:contact_id])
	@address = Address.find(params[:address_id])
	erb :'addresses/edit'
end

# =================================================

# create address
post '/contacts/:id/addresses' do
	@contact = Contact.find(params[:id])
	@address = @contact.addresses.create(params[:address])
	redirect "contacts/#{@contact.id}"
end

# update address
post '/contacts/:contact_id/addresses/:address_id' do
  @contact = Contact.find(params[:contact_id])
  edit_address = Address.find(params[:address_id])
  @address = edit_address.update(params[:address])
  redirect "contacts/#{@contact.id}"
 end