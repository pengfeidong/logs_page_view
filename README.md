# Logs_page_view
[![Gem Version](https://badge.fury.io/rb/logs_page_view.svg)](https://badge.fury.io/rb/logs_page_view)
[![CircleCI](https://circleci.com/gh/kirillshevch/logs.svg?style=shield&circle-token=5e904bb791d31a5f8bd06b0cf29746f69aeb6caa)](https://circleci.com/gh/kirillshevch/logs)
[![Maintainability](https://api.codeclimate.com/v1/badges/c121e93550b2e6e4d2ae/maintainability)](https://codeclimate.com/github/kirillshevch/logs/maintainability)

Mountable Rails Engine for displaying, tail and download logs from a browser

This Gem is a fork [kirillshevch/logs](https://github.com/kirillshevch/logs).

New features:

- Add the new action for TAIL and DOWNLOAD log file.
- Use bootstrap like front-end.
- Optimise use RAM for load log file.


## Installation
Add this line to your application's Gemfile:

```ruby
gem 'logs_page_view'
```

And then execute:
```bash
$ bundle
```

Mount Engine:

`config/routes.rb`
```ruby
Rails.application.routes.draw do
  mount Logs::Engine => '/logs'
end
```

Look up on `/logs` route.

## Demo

### Index page
![Logs](https://github.com/pengfeidong/logs_page_view/blob/master/log_index.png "Logs")

### Download log file
![Logs](https://github.com/pengfeidong/logs_page_view/blob/master/log_download.png "Logs")

### Tail log file page
![Logs](https://github.com/pengfeidong/logs_page_view/blob/master/log_tail.png "Logs")

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
