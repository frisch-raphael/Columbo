Rails.application.routes.draw do
  resources :engagements do
    collection do
      delete 'destroy_multiple'
    end
  end
  # resources :companies, only: [:show, :edit, :update, :destroy]

  post '/engagements/:id/companies', to: 'companies#engagement_create'
  put '/engagements/:id/companies/:company_id', to: 'companies#engagement_update'
  post '/engagements/:id/contacts', to: 'contacts#engagement_create'
  put '/engagements/:id/contacts/:contact_id', to: 'contacts#engagement_update'
  delete '/engagements/:id/contacts/:contact_id', to: 'contacts#engagement_destroy'
  get '/engagements/:id/contacts', to: 'contacts#engagement_index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
