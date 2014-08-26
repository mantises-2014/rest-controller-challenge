get '/' do
  erb :index

end

get '/contacts' do
  # @contact = "santi"
  @contacts = Contact.all
  # @contact = Contact.new
  erb :"/contacts/index"
end

post '/contacts' do
  Contact.create!(params[:contact])
  redirect "/contacts"
end

get '/contacts/new' do
  @contact = Contact.new
  erb :"/contacts/new"
end

get '/contacts/:contact_id' do
  "We're here"
  id = params[:contact_id]
  @contact = Contact.find(id)
  erb :"contacts/show"
end


get '/contacts/:contact_id/edit' do
  "we're here again"
  id = params[:contact_id]
  @contact = Contact.find(id)
  erb :"contacts/edit"
end

post '/contacts/:contact_id' do
  id = params[:contact_id]
  if params[:delete]
     Contact.destroy(id)
  else
    contact = Contact.find(id)
    contact.update(params[:contact])
  end
  redirect "/contacts"
end

get '/contacts/:contact_id/addresses/new' do
  id = params[:contact_id]
  @contact = Contact.find(id)
  @address = Address.new
  erb :"addresses/new"
end

post '/contacts/:id/addresses' do
  id = params[:id]
  attribute_hash = params[:address]
  attribute_hash[:contact_id] = id
  Address.create!(attribute_hash)
  redirect "/contacts/#{id}"
end

get '/contacts/:contact_id/addresses/:address_id/edit' do
  address_id = params[:address_id]
  contact_id = params[:contact_id]

  @contact = Contact.find(contact_id)
  @address = Address.find(address_id)

  erb :"addresses/edit"

end

post '/contacts/:contact_id/addresses/:address_id' do
  address_id = params[:address_id]
  contact_id = params[:contact_id]

  if params[:delete]
     Address.destroy(address_id)
  else
    # contact = Contact.find(contact_id)
    # contact.update(params[:contact])
    address = Address.find(address_id)
    address.update(params[:address])
  end
  redirect "/contacts/#{contact_id}"
end













