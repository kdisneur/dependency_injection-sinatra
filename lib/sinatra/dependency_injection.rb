require 'sinatra/base'
require 'sinatra/dependency_injection/helper'

module Sinatra
  module DependencyInjection
    def self.registered(base)
      base.dependency_injection_path 'services.yml'
    end

    def dependency_injection_path(file_path=nil)
      @dependency_injection_path = file_path if file_path
      @dependency_injection_path
    end
  end

  register Sinatra::DependencyInjection
  Delegator.delegate :dependency_injection_path
end
