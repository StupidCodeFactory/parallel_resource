module ParallelResources
  module Http

    module CommonMethods
    
      @@client = Client.instance

      # Execute a GET request
      # 
      # @param [Integer] id of the remote resource
      # @return [Array] Array of ParalleRequest::Resource
      def get(*args)
        prepare_request(:get, args)
        @@client.add(:get, @path, *args)
      end

      # Execute a POST request
      # 
      # @param [Integer] id of the remote resource
      # @return [Boolean] true if request was a success or false if any failure
      def post(*args)
        prepare_request(:post, args)
        @@client.add(:post, @path, *args)
      end
    
      # Execute a put request
      # 
      # @param [Integer] id of the remote resource
      # @return [Boolean] true if request was a success or false if any failure
      def put(*args)
        prepare_request(:put, args)
        @@client.add(:put, @path, *args)
      end

      # Execute a put request
      # 
      # @param [Integer] id of the remote resource
      # @return [Boolean] true if request was a success or false if any failure
      def delete(*args)
        prepare_request(:delete, args)
        @@client.add(:delete, @path, *args)
      end
    
      def method_missing(meth, *args, &block)
        if meth.to_s =~ /^(get|post|put|delete)_(.+)$/
          @@client.add($1.to_sym, build_no_standard_path($2.to_sym), *args)
        else
          super(meth, *args, &block)
        end
      end
    
      private
    
      def prepare_request(http_method, args)
        validate_params!(http_method, args)
        set_id(args.shift)
        build_path
      end
    
      def set_id(id)
        @id = id
      end

      def build_path
        @path = URI::HTTP.build(:host => host, :port => port, :path => "#{resource_path}/#{@id}").to_s
      end

      def build_no_standard_path(non_standard_resource_path)
        @path = URI::HTTP.build(:host => host, :port => port, :path => "/#{non_standard_resource_path}").to_s
      end
          
      def validate_params!(http_method, args)
        raise "Can not #{http_method} a resource without a valid integer id" unless valid_id?(args)
      end
    
      def valid_id?(args)
        !args.empty? && args.first.class == Fixnum
      end

    end#CommonMethods
  
  end#Http
end#ParallelResources