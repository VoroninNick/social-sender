Rails.application.routes.draw do
  root to: 'pages#index'

  scope :articles, controller: "articles" do
    root action: "index", as: :articles
    scope ":id" do
      post "publish", to: "articles#publish"
    end

  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount Ckeditor::Engine => '/ckeditor'

end
