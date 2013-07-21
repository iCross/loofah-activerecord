require 'rails'
module Loofah::ActiveRecord
  class Railtie < Rails::Railtie
    initializer "loofah-activerecord.initialize" do |app|
      if app.railties.respond_to?(:all)
        all_method = :all
      else
        all_method = :_all
      end
      activerecord_railtie = app.railties.send(all_method).select {|railtie| railtie.class.to_s == "ActiveRecord::Railtie" }
      if activerecord_railtie
        require 'loofah/activerecord/active_record'
        require 'loofah/activerecord/xss_foliate'
      end
    end
  end
end
