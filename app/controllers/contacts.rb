get '/contacts' do
  @contacts = Contact.all
  erb :'contacts/index'
end

get '/contacts/new' do
  @contact = Contact.new
  erb :'contacts/new'
end

get '/contacts/:id/edit' do
  @contact = Contact.find(params[:id])
  erb :'contacts/edit'
end

get '/contacts/:id' do
  @contact = Contact.find(params[:id])
  erb :'contacts/show'
end

# ===========================================================

# Update contact
post '/contacts/:id' do
  @contact = Contact.find(params[:id])
  @contact.update(params[:contact])
  redirect "/contacts/#{@contact.id}"
end

# Delete Contact
post '/contacts/:id/delete' do
  Contact.find(params[:id]).destroy
  redirect "/contacts"
end

# Create contact
post '/contacts' do
  @contact = Contact.create(params[:contact])
  @contact.save
  @contacts = Contact.all
  erb :'contacts/show'
end
