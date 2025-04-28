class HomeController < ApplicationController

def homepage
  render({ :template => "home_templates/home"})
end 



def process_inputs

  @the_image = params.fetch("image_param", nil)

  @the_description = params.fetch("description_param", "")

  c = OpenAI::Chat.new 
  c.system("You are a nutritionist, specialized in Mediterranean diet")
  c.user("Here is an image:", image: @the_image)
  c.user(@the_description) 
  c.schema = '{
      "name": "nutrition_facts",
      "schema": {
        "type": "object",
        "properties": {
          "carbohydrates": {
            "type": "number",
            "description": "The amount of carbohydrates in grams."
          },
          "protein": {
            "type": "number",
            "description": "The amount of protein in grams."
          },
          "calories": {
            "type": "number",
            "description": "The total amount of calories in kilocalories."
          }
        },
        "required": [
          "carbohydrates",
          "protein",
          "calories"
        ],
        "additionalProperties": false
      },
      "strict": true
    }' 
  @structured_output = c.assistant! 

  @g_carbs = @structured_output.fetch("carbohydrates")
  @g_protein = @structured_output.fetch("protein")
  @kcal = @structured_output.fetch("calories")
  
  render({:template => "home_templates/results"})
end 
end 
