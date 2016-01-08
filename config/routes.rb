Rails.application.routes.draw do

 root                  "creatures#index"
 get "/creatures", to: "creatures#index", as: "creatures"
 post "/creatures", to: "creatures#create"
 get "/creatures/new", to: "creatures#new", as: "new_creature"
 get "/creatures/:id/edit", to: "creatures#edit", as: "edit_creature"
 get "/creatures/:id", to: "creatures#show", as: "creature"
 patch "/creatures/:id", to: "creatures#update"
 put "/creatures/:id", to: "creatures#update"
 delete "/creatures/:id", to: "creatures#destroy"

# root GET    /  creatures#index
# creatures     GET    /creatures       creatures#index
#               POST   /creatures       creatures#create
# new_creature  GET    /creatures/new   creatures#new
# edit_creature GET    /creatures/:id/edit creatures#edit
# creature      GET    /creatures/:id   creatures#show
#               PATCH  /creatures/:id   creatures#update
#               PUT    /creatures/:id   creatures#update
#               DELETE /creatures/:id   creatures#destroy


end
