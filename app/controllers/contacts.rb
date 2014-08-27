#show all contacts

get '/' do
  erb :index
end

get '/contacts' do
  @contacts = Contact.all
  erb :'contacts/index'
end
# ----------------------------------------- #
#create new contact
get '/contacts/new' do
  @contact = Contact.new
  erb :'contacts/new'
end

get '/contacts/show' do
  erb :'contacts/show'
end

post '/contacts' do
  @contact = Contact.create(params[:contact])
  @contact.save
  erb :'contacts/show'
end

# ----------------------------------------- #
#edit existing contact
get '/contacts/:id' do
  @contact = Contact.find(params[:id])
  erb :'contacts/show'
end

get '/contacts/:id/edit' do
  @contact = Contact.find(params[:id])
  erb :'contacts/edit'
end

post '/contacts/:id' do
  @contact = Contact.find(params[:id])
  @contact.update_attributes(params[:contact])
  erb :'contacts/show'
end

# ----------------------------------------- #
#delete existing contact

post '/contacts/:id/delete' do
  @contact = Contact.find(params[:id])
  @contact.destroy
  redirect '/contacts'
end








