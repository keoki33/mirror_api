class CommandsController < ApplicationController
    
   def index
    @commands = Command.all
    render json: @commands.to_json
  end

  def show
    @command = Command.find_by(id: params[:id])
    render json: @command.to_json
  end

  def new
    @command = Command.new
  end

  def create
     @response = {
  "payload": {
    "google": {
      "expectUserResponse": true,
      "richResponse": {
        "items": [
          {
            "simpleResponse": {
              "textToSpeech": params["queryResult"]["fulfillmentText"]
            }
          },
          {
            "mediaResponse": {
              "mediaType": "AUDIO",
              "mediaObjects": [
                {
                  "contentUrl": "https://github.com/keoki33/smart_mirror/raw/master/public/blank30.mp3",
                  "description": "A funky Jazz tune",
                  "icon": {
                    "url": "https://storage.googleapis.com/automotive-media/album_art.jpg",
                    "accessibilityText": "Album cover of an ccean view"
                  },
                  "name": "Jazz in Paris"
                }
              ]
            }
          }
        ]
      }
    }
  }
}
#  render json: @response.to_json
    # @score = Score.create(score: params[:score], game: params[:game], player_id: params[:player_id], name: params[:name])
    #   render json: @score.to_json
    #   @command = Command.create(score: params["queryResult"]["parameters"]["number"], game: "test", player_id: 1, name: "keo")
      
    puts "/////////////////////////////////////////"
    puts params
      puts "/////////////////////////////////////////"
    puts params["queryResult"]["parameters"].keys
        puts "/////////////////////////////////////////"
    puts params["queryResult"]["parameters"].values
    puts "/////////////////////////////////////////"
    puts params["queryResult"]["fulfillmentText"]

    @command = Command.create(key: params["queryResult"]["parameters"].keys[0], value: params["queryResult"]["parameters"].values[0], user_id:1)
    render json: @response.to_json
    puts @command.key
    ActionCable.server.broadcast 'update_channel',
   {key: @command.key,
    value: @command.value,
  command: params}
    
    
    
   
    
  end

 






end
