# This script creates a new sample rails application, install/configure has_star

rails new has_star_example --skip-test-unit --skip-bundle
cd has_star_example
echo "gem 'has_star', git: 'git://github.com/railslab/has_star.git'" >> Gemfile
bundle install
rails g resource post title --no-helper --no-assets

# sample controller
cat <<'EOF' >| app/controllers/posts_controller.rb
class PostsController < ApplicationController
  before_action -> { sleep 0.5 }, only: :toggle_star

  def index
    @posts = Post.all
  end
end
EOF

# basic routes
cat <<'EOF' >| config/routes.rb
Rails.application.routes.draw do
  resources :posts, only: :index
  root 'posts#index'
end
EOF

rails g has_star post
rake db:migrate

# sample index
cat <<'EOF' >| app/views/posts/index.html.erb
<%= link_to 'all', posts_path %>
 |
<%= link_to 'starred', starred_posts_path %>
 |
<%= link_to 'unstarred', unstarred_posts_path %>

<ul>
  <% @posts.each do |post| %>
  <li>
    <%= has_star post %> |
    <%= post.title %>
  </li>
  <% end %>
</ul>
EOF

# populate database
cat <<'EOF' >| db/seeds.rb
10.times do |i|
  Post.create! title: "Post #{i}", star: [true, false].sample
end
EOF

rake db:seed
# navigate to http://localhost:3000/
rails server
