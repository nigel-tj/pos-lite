desc 'Load Pushvendor default configuration data.'

namespace :pushvendor do
  task :load_default_data => :environment do
    StoreConfiguration.create(currency: '')
  end
end
