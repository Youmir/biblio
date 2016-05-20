Rails.application.routes.draw do
  resources :editeurs
  get 'sessions/new'

  resources :users
  get 'biblio/index'

  post 'biblio/emprunter'

  post 'biblio/rendre'

  get 'biblio/check'

  post 'biblio/check'

  post 'biblio/list_emprunts'
  root 'sessions#new'
  resources :livres_empruntes
  resources :adherents
  resources :livres
  get 'login' , to: 'sessions#new'
  
  post 'login', to: 'sessions#create'
 
  get 'logout', to: 'sessions#destroy'

  delete 'logout', to: 'sessions#destroy'

  get 'check', to:'biblio#check'

  get 'valider',to: 'biblio#valider'

  get 'affich',to: 'biblio#affich'

  get 'emprunter',to: 'biblio#emprunter'

  post 'emprunter',to: 'biblio#emprunter'
  
  get 'rendre',to: 'biblio#rendre'

  post 'rendre',to: 'biblio#rendre'
  
  get 'affich_to_emp',to: 'biblio#affich_to_emp'
  get 'affich_to_mod',to: 'biblio#affich_to_mod'
  get 'affich_to_des',to: 'biblio#affich_to_des'

  get 'me_books',to: 'biblio#mebooks'
  
   get 'show',to: 'livre#show'

  post 'show',to: 'livre#show'

   get 'edit',to: 'livre#edit'
   
   get 'profile',to: 'biblio#profile'

  post 'edit',to: 'livre#edit'

  get 'destroy',to: 'livre#destroy'

  post 'destroy',to: 'livre#destroy'
 
  
  
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
