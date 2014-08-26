get '/contacts/:contact_id/addresses/new' do
  @contact = Contact.find(params[:contact_id])
  @address = Address.new

  erb :"addresses/new"
end

post '/contacts/:contact_id/addresses' do
  street = params[:street]
  city = params[:city]
  state = params[:state]
  zip = params[:zip]

  @address = Address.create(street: street, city: city, state: state, zip: zip)
  @contact = Contact.find(params[:contact_id])
  @contact.addresses << @address
  redirect to("/contacts/#{@contact.id}")

end

get "/contacts/:contact_id/addresses/:address_id/edit" do
  @contact = Contact.find(params[:contact_id])
  @address = Address.find(params[:address_id])
  erb :"addresses/edit"
end

post "/contacts/:contact_id/addresses/:address_id" do
  street = params[:street]
  city = params[:city]
  state = params[:state]
  zip = params[:zip]

  if street || city || state || zip
    address = Address.find(params[:address_id]).update(street: street, city: city, state: state, zip: zip)
    redirect to("/contacts/#{params[:contact_id]}") if address
  else
    Address.destroy(params[:address_id])
    redirect to("/contacts/#{params[:contact_id]}")
  end
end
