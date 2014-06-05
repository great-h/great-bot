require 'ruboty'

ENV["ROBOT_NAME"] = "@great_hiroshima"
Ruboty.logger.level = Logger::INFO
require_relative 'user_script'
include Ruboty

robot = Robot.new
message = Message.new(robot: robot)
Actions::Help.new(message).call
