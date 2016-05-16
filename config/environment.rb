# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

Amazon::Ecs.options = {
      associate_tag:     'ryh0508-22',
      AWS_access_key_id: 'AKIAI7IF6KMGCE2RLXCQ',
      AWS_secret_key:   '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'
}