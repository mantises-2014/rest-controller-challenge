get '/contacts' do

  @contacts = Contact.all

  erb :"contacts/index"
end

post '/contacts' do
  # get data
  # raise params.inspect
  # create contact using data

  # name = params['contact']['name']
  # email = params['contact']['email']
  # Contact.create({name: name, email: email})

  # but....
  # params['contact'] # => {name: "Mike", email: "mike@me.com"}
  # so...
  Contact.create(params['contact'])

  # render or redirect
  redirect "/contacts"
end

get '/contacts/new' do
  @contact = Contact.new()


  erb :"contacts/new"
end


