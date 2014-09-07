get '/' do
  @contacts = Contact.all
  # @address = Address.new
  erb :"contacts/index"
end

get '/contacts/new' do
  @contact = Contact.new
  erb :"contacts/new"
end

get '/contacts/:id' do
  @contact = Contact.find(params[:id])

  erb :"contacts/show"
end


post '/contacts' do
  @contact = Contact.create(params[:contact])
  redirect '/'
end

get '/contacts/:contact_id/edit' do
  @contact = Contact.find(params[:contact_id])

  erb :"contacts/edit"
end

post '/contacts/:id' do
  contact = Contact.find(params[:id])
  contact.update(params[:contact])
  redirect "/contacts/#{contact.id}"
end

get '/contacts/:id/addresses/new' do
  @contact = Contact.find(params[:id])
  @address = Address.new

  erb :"addresses/new"
end

post '/contacts/:id/addresses' do
  contact = Contact.find(params[:id])
  address = Address.create(params[:address])
  address[:contact_id] = contact.id
  address.save

  redirect "/contacts/#{contact.id}"
end



get '/contacts/:contact_id/addresses/:address_id/edit' do
  @contact = Contact.find(params[:contact_id])
  @address = Address.find(params[:address_id])

  erb :"addresses/edit"
end

post '/contacts/:contact_id/addresses/:address_id' do
  address = Address.find(params[:address_id])

  address.update(params[:address])
  address.contact_id = params[:contact_id]

  redirect "/contacts/#{params[:contact_id]}"
end

delete '/contacts/:contact_id/addresses/:address_id' do
  address = Address.find(params[:address_id])
  address.destroy

  redirect "/contacts/#{params[:contact_id]}"
end