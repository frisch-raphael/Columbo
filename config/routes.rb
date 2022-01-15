Rails.application.routes.draw do
  resources :engagements do
    collection do
      delete 'destroy_multiple'
    end
  end
  post '/engagements/:id/companies', to: 'companies#engagement_create'

  resources :companies do
    resources :contacts
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
