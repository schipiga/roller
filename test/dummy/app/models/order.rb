class Order < ActiveRecord::Base
  belongs_to :status

  access_rules 'status.title', new: [:assigned, :delayed, :blocked],
                               assigned: [:in_work, :completed],
                               delayed: [:recovery],
                               blocked: [:recovery],
                               in_work: [:completed]
                        
end
