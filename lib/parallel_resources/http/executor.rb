module ParallelResources
  module Http
    
    class Executor

      class << self
        def run
          # http://taf2.github.com/curb/
          @responses = {}
          @curl_multi ||= Curl::Multi.new
          [:get_queue, :post_queue, :put_queue, :delete_queue].each do |http_verb_queue|

            # This block creates instances of Curl::Easy requests 
            Client.instance.send(http_verb_queue).each do |http|

              c = Curl::Easy.new(http.first) do |curl|
                curl.follow_location = true
                curl.on_body do |data|
                  @responses[http.first] = data; data.size 
                end
                curl.on_success do |easy|
                  puts "success, add more easy handles AND SERIALIZE FUCKING RESULTS" 
                end
                curl.on_failure do |easy, code|
                  ErrorResponse.new(easy.response_code)
                end
              end
              @curl_multi.add(c)
            end
            @curl_multi.perform

          end
          puts @responses.inspect
        end
      end#singleton
      
    end#Executor

  end#Http
end#ParallelResources