require 'rack'
require 'pry'
require 'typhoeus'
require 'json'


class App
    def call(env)
        status_code = 404
        headers = {
            "Content-Type" => "text/html"
        }
        body = ["<h1>404 Not Found </h1>"]

        case env["PATH_INFO"]

        when "/"
            status_code = 200
            body = ["<!DOCTYPE html>
                            <html>
                            <head>
                                <title>OMDB Search</title>
                            </head>
                            <body>
                            <h1>Welcome to the Movie Search</h1>
                            <p> Search for a movie: </p>
                            <form action='results' method='GET'>
                                <input type='text' name='search'>
                                <input type='submit'>
                            </form>
                            </body>
                            </html>"
            ]
        when "/results"
            status_code = 200
            #Get form data
            str = env["QUERY_STRING"]
            data = Rack::Utils.parse_nested_query(str)
            query = data["search"]
            query.gsub(" ", "%20")
            results = Typhoeus.get("http://www.omdbapi.com/?s=#{query}")
                     

            results = JSON.parse(results.body)
            body = ["<h1> Search Results for: #{query} </h1>"]
            results["Search"].each do |movie|
                title = movie["Title"]
                year = movie["Year"]
                el = "<li><b>#{title}</b> - #{year}</li>"
                body.push(el)
            end

            body.push("<a href='http://www.google.com'>Search Again </a>")


        end

        [status_code,headers,body]
    end
end

Rack::Handler::WEBrick.run(App.new)
