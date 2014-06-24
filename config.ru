# -*- coding: utf-8 -*-
require 'thread'
ENV['RUBOTY_ENV'] = ENV['RACK_ENV'] || 'development'

require 'ruboty'

module Ruboty::HTTPd
  def call(env)
    [200, {'Content-type' => 'text/html'}, ['<!DOCTYPE html><meta charset="UTF-8"><p>すごい広島']]
  end
end
Ruboty::Robot.include(Ruboty::HTTPd)

robot = Ruboty::Robot.new(load: 'user_script.rb')
puts Ruboty::AdapterBuilder.adapter_classes


Thread.new do
  robot.run
end

run robot
