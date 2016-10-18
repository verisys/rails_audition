
Rails.application.config.generators do |g|
  g.orm :active_record     
  g.assets false
  g.helper false
  g.test_framework :rspec,
    fixtures: true,
    view_specs: false,
    helper_specs: false,
    routing_specs: false,
    request_specs: false
  g.fixture_replacement :factory_girl, dir: "spec/factories"
  g.template_engine :haml
end