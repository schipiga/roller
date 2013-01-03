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
      before_update { |i| i.access(*data) }
    end
  end

  module InstanceMethods
    protected
    def access(argc, *argv)
      if status_id_changed?
        @argc = argc
        @hash = argv.last
        unless rules.include?(request)
          errors[:base] << "Prohibited assignment for #{@model}"
          false
        end
      end
    end

    def request
      status.title.to_sym
    end

    def rules
      @model, @column = model_and_column
      @hash[current_key]
    end

    def model_and_column
      @argc.split('.')
    end

    def current_key
      model.find(status_id_was)[@column].to_sym
    end
    
    def model
      @model.capitalize.constantize
    end
  end
end

class ActiveRecord::Base
  include Roller
end
