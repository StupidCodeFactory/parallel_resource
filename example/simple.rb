require "../lib/ParallelResources"

class Project < ParallelResources::Resource::Base
  configure :host => "localhost", :resource_path => '/projects', :port => 5000
end

Project.get(1)
Project.get_Stuff
ParallelResources::Http::Executor.run
