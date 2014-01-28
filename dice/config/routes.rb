Dice::Application.routes.draw do
  root 'dice#index'

  post("/start_roll" => "dice#start_roll", :as => "dice")
  post({"/" => "dice#index"})
  get "/:sum" => "dice#roll"

  # TODO: POST WITH PARAMS
  post({"/roll" => "dice#roll"})
  # get "/goal=:sum" => 'dice#roll', :as => 'roll'
end

