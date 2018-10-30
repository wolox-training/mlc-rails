require 'factory_bot_rails'

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  config.before(:all) do
    FactoryBot.find_definitions if FactoryBot.factories.count == 0
  end
end
