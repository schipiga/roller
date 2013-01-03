module Roller

  def self.included(base)
    base.send :extend, ClassMethods
    base.send :include, InstanceMethods
  end

  def ensure_unique(base)
    begin
      self[name] = yield
    end while self.class.exists?(name: self[name])
  end

  module ClassMethods
    def access_rules(*data)
      before_update { |i| i.some(*data) }
    end
  end

  module InstanceMethods
    def some(argc, *argv)
      model = argc.split('.')
      argv.last[model.first.capitalize.constantize.find(self.status_id_was)[model.last].to_sym].include?(self.status.title.to_sym)
    end
  end
end

class ActiveRecord::Base
  include Roller
end
