Roller
======

Implementing ability to manage activerecord field value in update, depending of previous value of this field.


Installation
------------

Just add to Gemfile:

```ruby
gem "roller"
```

or - for latest version:

```ruby
gem "roller", git: "git@github.com:sergeychipiga/roller.git"
```


Usage
-----

Let's consider simple sample:
There are models Order and Status (Status has_many :orders and Order belongs_to :status), some statuses with titles "new", "assigned", "blocked", "delayed", "in_work", "completed". And you want order instance can move from "new"-status to "assigned"-status only; just add below code to Order.rb:

```ruby
access_rules "status.title", new: [:assigned],
                             assigned: [:blocked, :delayed, :in_work],
                             in_work: [:completed]
```


Licence
-------

This project rocks and uses MIT-LICENSE.
