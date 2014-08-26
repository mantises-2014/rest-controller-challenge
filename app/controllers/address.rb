get '/contacts/:id/addresses/new' do |id|
  @contact = Contact.find(id)
  @address = Address.new

  erb :"/addresses/new"
end

post '/contacts/:id/addresses' do |id|
  @contact = Contact.find(id)
  @contact.addresses << Address.create(params["address"])
  @contact.save

  redirect :"/contacts/#{id}"
end

post '/contacts/:contact_id/addresses/:address_id' do |contact_id, address_id|
  @address = Address.find(address_id)
  @address.update(params["address"])

  redirect :"/contacts/#{contact_id}"
end

get '/contacts/:contact_id/addresses/:address_id/edit' do |contact_id, address_id|
  @contact = Contact.find(contact_id)
  @address = Address.find(address_id)

  erb :"/addresses/edit"
end
