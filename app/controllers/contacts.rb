get '/contacts' do
	@contacts = Contact.all
	erb :'contacts/index'
end


get '/contacts/new'  do
	@contact = Contact.new
	erb :'contacts/new'
end

get '/contacts/:id' do
	@contact = Contact.find(params[:id])
	erb :'contacts/show'
end

get '/contacts/:id/edit' do
	@contact = Contact.find(params[:id])
	erb :'contacts/edit'
end


# =======================================================

# Create new contact
post '/contacts' do
	@contact = Contact.create(params[:contact])
	if @contact.save
		erb :'contacts/show'
	else
		redirect '/contacts/new'
	end
end

# Update contact
post '/contacts/:id' do
	@contact = Contact.find(params[:id])
	if @contact.update_attributes(params[:contact])
		erb :'contacts/show'
	else
		redirect "/contacts/#{contact.id}/edit"
	end
end

# Delete contact
post '/contacts/:id/delete' do
	@contact = Contact.find(params[:id])
	@contact.destroy
	redirect '/contacts'
end

