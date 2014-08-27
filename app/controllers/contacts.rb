#renders index page with contacts listed out
get '/contacts' do
  @contacts = Contact.all

  erb :"contacts/index"
end

get '/contacts/new' do
  @contact = Contact.new()

  erb :"contacts/new"
end

#get data from form
#create contact using data
#render data and redirect
post '/contacts' do
  Contact.create(params['contact'])

  redirect "/contacts"
end

#show info for a particular contact.id
get '/contacts/:contact_id' do
  @contact = Contact.find(params[:contact_id])

  erb :"contacts/show"
end

get '/contacts/:contact_id/edit' do
  @contact = Contact.find(params[:contact_id])

  erb :"contacts/edit"
end

post '/contacts/:contact_id' do
  @contact = Contact.update(params['contact'])

  erb :"contacts/form"
end



# post '/contacts' do
#   name = params['contact']['name']

#   Contact.update(name: name)

#   redirect "/contacts"
# end





