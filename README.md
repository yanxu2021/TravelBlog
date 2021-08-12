*******************************************************************************************************************************
# Challenges
### As a developer, I have been commissioned to create an application where a user can see and create blog posts.
### As a developer, I can create a full-stack Rails application.
## Setup
1st person：
```
$rails new app_name -d postgresql -T
$cd into app_name
$rails db:create
$git remote add origin http...
$git checkout -b main
$git add .
$git commit -m "initial commit"
$git push origin main
```
2nd person：
```
$git clone projRepoPath
$cd folderName
$rails db:create
$bundle
$yarn
$git status
$git branch
```

main process idea:
```
Create a new Rails app in the appropriate folder: $ rails new blog_post_challenge -d postgresql -T
$ cd blog_post_challenge
Create a database: $ rails db:create
Add the dependencies for RSpec:
$ bundle add rspec-rails
$ rails generate rspec:install
Generate the model with appropriate columns and data types
$ rails db:migrate
Generate the controller
Begin the rails server: $ rails server
In a browser navigate to: http://localhost:3000
```

### As a developer, my blog post can have a title and content.
App_name--> Travel
```
$git checkout -b index
$rails g model Travel title:string content:text
$rails db:migrate
$rails c
>Travel.create tilte:"China", content:"Food is delicious"
```
As a developer, I can add new blog posts directly to my database.
As a user, I can see all the blog titles listed on the home page of the application.
As a user, I can click on the title of a blog and be routed to a page where I see the title and content of the blog post I selected.
As a user, I can navigate from the show page back to the home page.
As a user, I see a form where I can create a new blog post.
As a user, I can click a button that will take me from the home page to a page where I can create a blog post.
As a user, I can navigate from the form back to the home page.
As a user, I can click a button that will submit my blog post to the database.
As a user, I when I submit my post, I am redirected to the home page.

## Stretch Challenges
As a user, I can delete my blog post.
As a user, I can update my blog post.
As a developer, I can ensure that all blog posts have titles and content for each post.
As a developer, I can ensure that all blog post titles are unique.
As a developer, I can ensure that blog post titles are at least 10 characters.

*******************************************************************************************************************************
# Instructor's Note - Full-stack Rails

Setup
- create a Rails app on Desktop
- created db
- add remote from GHCR
- created branch main
- initial commit
- checkout index branch

每次开始一个新的任务的时候都先add commit push，然后checkout到一个新的branch上面开始一个新的功能的添加。
### INDEX
- rails g model Herb name:string watered:string
- rails db:migrate
- rails c to add some data
- Herb.create name: 'Thyme', watered: 'no'
- Herb.create name: 'Basil', watered: 'yes'
- Herb.create name: 'Cilantro', watered: 'yes'
- Herb.all - array of db instances
- rails g controller Herb   (named exactly the same as the model)
- create an index method
```ruby
def index
  @herbs = Herb.all
end
```
- create a route `get '/herbs' => 'herb#index'`
- create a view called exactly: index.html.erb
```
<ul>
  <% @herbs.each do |herb| %>
    <li><%= herb.name %></li>
  <% end %>
</ul>
```

### SHOW
- Show: Just one thing from the db
- controller method
def show
  @herb = Herb.find(params[:id])
end
- create a route `get '/herbs/:id' => 'herb#show'`
- create a view called exactly: show.html.erb

Parameters: {"id"=>"1"}
params[:id] ---> 1


Creating Navigation
- Show => Index
- added an alias to the route: `get '/herbs' => 'herb#index', as: 'herbs'`
- reference the alias as the herbs_path
<h4><%= link_to 'Back Home', herbs_path %></h4>
- Index => Show
- added an alias: `get '/herbs/:id' => 'herb#show', as: 'herb'`
- reference the alias as herb_path(herb) <<-- param


### NEW
- New: shows a form
- controller method
```
def new
  @herb = Herb.new
end
```
- create a route `get '/herbs/new' => 'herb#new'`
- created a view using form_with https://guides.rubyonrails.org/form_helpers.html
```
<%= form_with model: @herb, local: true do |form| %>
  <%= form.label :name %>
  <%= form.text_field :name %>
  <br>
  <br>
  <%= form.label :watered %>
  <%= form.text_field :watered%>
  <br>
  <br>
  <%= form.submit 'Add Herb'%>
<% end %>
```
- Added navigation from index => new, and from new => index


### CREATE
- Create - adding stuff to db
- controller method
```
def create
  @herb = Herb.create(herb_params)
end

private
# Strong params:
def herb_params
  params.require(:herb).permit(:name, :watered)
end
```
- create a route `post '/herbs' => 'herb#create'`
- view: submit button and redirects
```ruby
def create
  @herb = Herb.create(herb_params)
  if @herb.valid?
    redirect_to herbs_path
  else
    redirect_to new_herb_path
  end
end
```


### DESTROY
- Destory - removing an item from the db
- controller method
```ruby
def destroy
  @herb = Herb.find(params[:id])
  if @herb.destroy
    redirect_to herbs_path
  else
    redirect_to herb_path(@herb)
  end
end
```
- create a route `delete '/herbs/:id' => 'herb#destroy', as: 'delete_herb'`
- view is a button on the show page `<h4><%= link_to 'Delete Herb', delete_herb_path(@herb), method: :delete %></h4>`

### EDIT
- Edit - gives us a form to make changes to an existing item
- controller method
```
def edit
  @herb = Herb.find(params[:id])
end
```
- create a route `get '/herbs/:id/edit' => 'herb#edit', as: 'edit_herb'`
- create a view: edit.html.erb
```
<h2>Update an Herb</h2>

<%= form_with model: @herb, method: :patch, local: true do |form| %>
  <%= form.label :name %>
  <%= form.text_field :name %>
  <br>
  <br>
  <%= form.label :watered %>
  <%= form.text_field :watered%>
  <br>
  <br>
  <%= form.submit 'Edit Herb'%>
<% end %>
<br>
<br>
<h4><%= link_to 'Back Home', herbs_path %></h4>
```
- navigation from show => edit
```
<h4>
  <%= link_to 'Edit Herb', edit_herb_path(@herb) %>
</h4>
```

### UPDATE
- Update: modifies one instance in the db
- controller method
```ruby
def update
  @herb = Herb.find(params[:id])
  @herb.update(herb_params)
  if @herb.valid?
    redirect_to herb_path(@herb)
  else
    redirect_to edit_herb_path(@herb)
  end
end
```
- create a route `patch 'herbs/:id' => 'herb#update'`
