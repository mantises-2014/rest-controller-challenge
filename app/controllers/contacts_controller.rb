get '/contacts' do
  @contacts = Contact.all

  erb :"contacts/index"
end

get '/contacts/new' do
  if params[:id]
    @contact = Contact.find(params[:id])
  else
    @contact = Contact.new
  end

  erb :"contacts/new"
end

post '/contacts' do
  name = params[:name]
  email = params[:email]
  @contact = Contact.create(name: name, email: email)
  # redirect to("/contacts/new?id=#{@contact.id}")
  redirect to("/contacts") if @contact
end

get '/contacts/:contact_id/edit' do
  @contact = Contact.find(params[:contact_id])

  erb :"contacts/edit"
end

post '/contacts/:contact_id' do
  id = params[:contact_id]
  name = params[:name]
  email = params[:email]

  if name || email
    contact = Contact.find(id).update(name: name, email: email)
    redirect to("/contacts/#{id}") if contact
  else
    Contact.destroy(id)
    redirect to("/contacts")
  end
end

get '/contacts/:contact_id' do
  id = params[:contact_id]
  @contact = Contact.find(id)

  erb :"contacts/show"
end
