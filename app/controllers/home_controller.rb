class HomeController < ApplicationController

def homepage
  render({ :template => "home_templates/home"})
end 
end 
