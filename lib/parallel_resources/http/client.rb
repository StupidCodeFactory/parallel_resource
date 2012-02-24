module ParallelResources
  module Http

    class Client
      include Singleton
      # TODO: make it thread safe. Use synchronize, monitor or mutex!
      # specially for jruby or rubinius
      @@get_queue, @@post_queue, @@put_queue, @@delete_queue = [], [], [], []

      def get_queue
        @@get_queue
      end

      def post_queue
        @@post_queue
      end

      def put_queue
        @@put_queue
      end

      def delete_queue
        @@delete_queue
      end
  
      def queues
        [@@get_queue, @@post_queue, @@put_queue, @@delete_queue]
      end
  
      def add(http_verb, url, payload = nil)
        send("#{http_verb}_queue") << [url, payload]
      end

    end#Client

  end#Http
end#ParallelResources