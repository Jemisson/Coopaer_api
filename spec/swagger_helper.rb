require 'rails_helper'

RSpec.configure do |config|
  config.swagger_root = Rails.root.join('swagger').to_s
  config.swagger_docs = {
    'v1/swagger.yaml' => {
      openapi: '3.0.1',
      info: {
        title: 'Coopaer API V1',
        version: 'v1'
      },
      paths: YAML.load_file(Rails.root.join('swagger/v1/swagger.yaml')),
    }
  }

  config.swagger_format = :yaml
end
