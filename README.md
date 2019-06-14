# VersionCore

## Installation

Add this line to your Gemfile:

```ruby
gem 'version_core'
```

Then execute:

```sh
$ bundle install
```

Copy migrations

```sh
$ rails version_core:install:migrations
```

Then do migrate

```sh
$ rails db:migrate
```

Run model generator

```sh
$ rails g role_core:model
```

## Stylesheets
add following code to your application active_admin.scss 
```sh
.choice {
  float: left;
}
```

## Mount
mount gem to your application
```
mount VersionCore::Engine => "/version_core"
```

## Request/Controller
```sh
/version_core/versions
params
channel [:huawei, :ios, ...]
os_type anroid/ios
push_version current version in the app(1.0.0/2.0.0)
```


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/version_core. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the VersionCore project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/version_core/blob/master/CODE_OF_CONDUCT.md).
