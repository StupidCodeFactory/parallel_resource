module ParallelResources
  module Resource
  
    class Base
      include ParallelResources::CoreExtensions::ClassLevelInheritableAttributes
      extend ParallelResources::Http::CommonMethods
      cattr_inheritable :host, :port, :resource_path
      @port          = 80
      @host          = nil
      @resource_path = nil

      class << self
        def configure(args)
          args.each do |k,v|
            instance_variable_set("@#{k}",v).inspect
          end
        end
      end

    end#Base

  end#Resource
end#ParallelResources