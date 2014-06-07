# -*- coding: utf-8 -*-
require 'thread'
require 'ruboty'

module Ruboty::HTTPd
  def call(env)
    [200, {'Content-type' => 'text/html'}, ['<!DOCTYPE html><meta charset="UTF-8"><p>すごい広島']]
  end
end
Ruboty::Robot.include(Ruboty::HTTPd)

environment = ENV['RACK_ENV'] || 'development'
robot = Ruboty::Robot.new(load: environment + '.rb')


Thread.new do
  robot.run
end

run robot
