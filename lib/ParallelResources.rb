$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))
# WhyTheHellThisFileCamelCased ????? damn_it!!!!
module ParallelResources
  VERSION = '0.0.1'
  require 'rubygems'
  require 'uri'
  require 'singleton'
  require 'curb'
  require 'parallel_resources/http/client'
  require 'parallel_resources/http/common_methods'
  require 'parallel_resources/http/error_response'
  require 'parallel_resources/http/executor'
  require 'parallel_resources/core_extensions/inheritable_attributes'
  require 'parallel_resources/resource/base'
end