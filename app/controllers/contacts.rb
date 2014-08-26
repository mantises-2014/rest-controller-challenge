get '/contacts' do
  @contacts = Contact.all
  erb :"/contacts/index"
end

post '/contacts' do
  Contact.create(params[:contact])
  @contacts = Contact.all
  erb :"/contacts/index"
end

get '/contacts/new' do
  @contact = Contact.new
  erb :"contacts/new"
end

get '/contacts/:id' do
  @contact = Contact.find(params[:id])
  erb :"contacts/show"
end

get '/contacts/:id/edit' do
  @contact = Contact.find(params[:id])
  erb :"contacts/edit"
end

post '/contacts/:id' do
  p params
  if params[:contact] == nil
    Contact.find(params[:id]).destroy
    redirect to('/contacts')
  else
    Contact.update(params[:id], params[:contact])
    @contact = Contact.find(params[:id])
    erb :"contacts/show"
  end
end

delete '/contacts/:id' do
  Contact.find(params[:id]).destroy
  @contacts = Contact.all
  redirect to('/contacts')
end

{"contact"=>{"name"=>"liberty", "email"=>"rightbrain@gmail.com"}, "splat"=>[], "captures"=>["1"], "id"=>"1"}
{"splat"=>[], "captures"=>["1"], "id"=>"1"}
