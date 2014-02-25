require 'sinatra/base'
require 'dependency_injection/container'
require 'dependency_injection/loaders/yaml'

module Sinatra
  module DependencyInjection
    module Helper
      def container
        @dependency_injection_container ||= create_dependency_injection_container
      end

      private

      def create_dependency_injection_container
        dependency_injection_container = ::DependencyInjection::Container.new
        populate_dependency_injection_container(dependency_injection_container)

        dependency_injection_container
      end

      def populate_dependency_injection_container(container)
        loader = ::DependencyInjection::Loaders::Yaml.new(container)
        loader.load(settings.dependency_injection_path)
      end
    end
  end

  Base.helpers DependencyInjection::Helper
end
