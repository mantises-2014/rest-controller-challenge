
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
  # 1. read the data out of params
  # 2. create a new Dog instance with the data
  @contact = Contact.new(params[:contact])

  # 3. save dog
  @contact.save
    # 4. redirect to show action for the new dog
    # redirect "/dogs/#{@dog.id}"

    # 5. re-render the new page with the dog's info in the form
    erb :'contacts/show'

end

# EDIT
get '/contacts/:id/edit' do
  # 1. find the dog from db
  @contact = Contact.find(params[:id])

  # 2. render the form with the dog's current attributes
  erb :'contacts/edit'
end

# UPDATE
put '/contacts/:id' do
  # 0. find the damn dog
  @contact = Contact.find(params[:id])

  # 1. gather the data from params
  # 2. update the dog's db record
  @contact.update_attributes(params[:contact])

  # 3. redirect to dog's show page
  redirect "/contacts/#{@contact.id}"
end

get '/contacts/:id' do
  @contact = Contact.find(params[:id])
  erb :'contacts/show'
end

