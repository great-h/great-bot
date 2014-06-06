require 'newrelic_rpm'

require_relative 'user_script'
Ruboty.handlers = Ruboty.handlers - [Ruboty::Handlers::Help]
