require 'sinatra/base'
require 'dependency_injection/container'
require 'dependency_injection/loaders/yaml'

module Sinatra
  module DependencyInjection
    module Helper
      def container
        return @dependency_injection_container if @dependency_injection_container

        @dependency_injection_container = ::DependencyInjection::Container.new
        loader = ::DependencyInjection::Loaders::Yaml.new(@dependency_injection_container)
        loader.load(settings.dependency_injection_path)

        @dependency_injection_container
      end
    end
  end

  Base.helpers DependencyInjection::Helper
end
