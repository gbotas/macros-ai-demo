class HomeController < ApplicationController

def homepage
  render({ :template => "home_templates/home"})
end 



def process_inputs

  @the_image = params.fetch("image_param")
  
  @the_description = params.fetch("description_param")
  
  render({:template => "home_templates/results"})
end 
end 
