get '/contacts' do
  @contacts = Contact.all

  erb :"contacts/index"
end

get '/contacts/new' do
  @contact = Contact.new

  erb :"contacts/new"
end

get '/contacts/:id' do |id|
  @contact = Contact.find(id)
  #@contact = Contact.find(params[:id]) # alternate for not having #|id|

  erb :"contacts/show"
end

get '/contacts/:id/edit' do |id|
  @contact = Contact.find(id)

  erb :"contacts/edit"
end

post '/contacts' do
  @contact = Contact.create(params["contact"])

  redirect :"/contacts/#{@contact.id}"
end

post '/contacts/:id' do |id|
  if params["contact"]
    @contact = Contact.find(id)
    @contact.update(params["contact"])

    redirect :"/contacts/#{id}"
  else
    Contact.find(id).destroy

    redirect :"/contacts"
  end
end

