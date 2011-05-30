module ParallelResources
  module Http

    class ErrorResponse
      def initialize(status)
        puts "got an error here is the status #{status.inspect} i should raise some ResourceErrors exception"
      end
    end

  end#Http
end#ParallelResources