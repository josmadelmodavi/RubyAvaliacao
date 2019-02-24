Rails.application.routes.draw do
	namespace :api do
		namespace :v2 do
			#get "hello", to: "vendas#hello_world"
			get "vendas_by_gasto", to: "vendas#vendas_by_gasto"
			get "vendas_by_quantidade", to: "vendas#vendas_by_quantidade"

			resources :vendas do
				resources :items
			end
		end
	end
end
