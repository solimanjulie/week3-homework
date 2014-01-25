Dice::Application.routes.draw do
  root 'dice#index'

  post("/start_roll" => "dice#start_roll", :as => "dice")
  # get({:action=>"roll", :controller=>"dice"})
end

