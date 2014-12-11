
get '/contacts' do
  @contacts = Contact.all
  erb :"contacts/index"
end

get '/contacts/new' do
  @contact = Contact.new
  erb :"contacts/new"
end

# CREATE
post '/contacts' do
  @contact = Contact.new(params[:contact])
  @contact.save
    erb :'contacts/show'
end

# EDIT
get '/contacts/:id/edit' do
  @contact = Contact.find(params[:id])
  erb :'contacts/edit'
end

# UPDATE
put '/contacts/:id' do
  @contact = Contact.find(params[:id])
  @contact.update_attributes(params[:contact])
  redirect "/contacts/#{@contact.id}"
end

get '/contacts/:id' do
  @contact = Contact.find(params[:id])
  erb :'contacts/show'
end


# DELETE
delete '/contacts/:id' do
  @contact = Contact.find(params[:id])
  @contact.destroy
  redirect "/contacts"
end

