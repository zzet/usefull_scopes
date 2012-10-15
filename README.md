# UsefullScopes

 Additional scopes for Active:Record models.

## Installation

Add this line to your application's Gemfile:

    gem 'usefull_scopes', :git => 'git://github.com/kaize/usefull_scopes.git'

include UsefullScopes into your Model

    include UsefullScopes

And then execute:

    $ bundle

## Usage

    class YourModel < ActiveRecord::Base

      include UsefullScopes

      attr_accessible :name,
                      :description,
                      :client_id

### Use scopes

    usefull = YourModel.random

    obj = YourModel.find(id)
    objs = YourModel.find(id)

    usefull = YourModel.exclude(obj)
    usefull = YourModel.exclude(objs)

    usefull = YourModel.by_updated_at
    usefull = YourModel.asc_by_updated_at

    usefull = YourModel.like_by_name('test')
    usefull = YourModel.ilike_by_name('test')

    usefull = YourModel.id_more(1234)
    usefull = YourModel.id_more(obj)

    usefull = YourModel.id_less(1234)
    usefull = YourModel.id_less(obj)

    usefull = YourModel.id_more_or_equal(1234)
    usefull = YourModel.id_more_or_equal(obj)

    usefull = YourModel.id_less_or_equal(1234)
    usefull = YourModel.id_less_or_equal(obj)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
