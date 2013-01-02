module Roller

  def self.included(base)
    base.extend ClassMethods
  end

  def ensure_unique(base)
    begin
      self[name] = yield
    end while self.class.exists?(name: self[name])
  end

  module ClassMethods
    def access_rules(*data)
      before_update lambda do |m|
        model = data.first.split('.')
        data.last[model.first.capitalize.constantize.find(m.status_id_was)[model.last].to_sym].include?(m.status.title.to_sym)
      end
    end
  end
end

class ActiveRecord::Base
  include Roller
end
