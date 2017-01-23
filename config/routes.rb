Rails.application.routes.draw do
  get '/' => 'posts#index'
  get 'posts/index'

  get 'posts/show/:post_id' => 'posts#show'

  get 'posts/new'

  post 'posts/create'

  get 'posts/edit/:post_id' => 'posts#edit'

  post 'posts/update'

  get 'posts/delete/:post_id' => 'posts#delete'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
