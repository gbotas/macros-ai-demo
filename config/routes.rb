Rails.application.routes.draw do


  # Solutions below. Don't peek until you try it yourself and get stuck!



  get("/solutions/blank_form", { :controller => "solutions", :action => "display_form" })
  
  post("/solutions/process_form", { :controller => "solutions", :action => "process_inputs" })

  get("/blank_form", { :controller => "home", :action => "homepage"})

  post("/process_form_inputs", { :controller => "home", :action => "process_inputs"})

  
end
