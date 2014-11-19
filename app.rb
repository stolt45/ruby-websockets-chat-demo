require 'sinatra/base'

module ChatDemo
  class App < Sinatra::Base
    $stdout.sync = true

    get "/" do
      uri = URI.parse(ARGV[0])
      puts uri.scheme
      erb :"index.html"
    end

    get "/assets/js/application.js" do
      content_type :js
      @scheme = "ws://"
      #@scheme = ENV['RACK_ENV'] == "production" ? "wss://" : "ws://"
      erb :"application.js"
    end
  end
end
