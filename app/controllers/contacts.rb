get '/contacts' do
  @contacts = Contact.all
  erb :'contacts/index'
end

get '/contacts/new' do
  @contact = Contact.create
  erb :'contacts/new'
end

post '/contacts' do
  @contact = Contact.create(params[:contacts])
  @contact.save
  erb :'contacts/index'
end

get '/contacts/:id/edit' do
  @contact = Contact.find(params[:id])
  erb :'contacts/edit'
end
