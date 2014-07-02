require 'spec_helper'
require 'handlers/talk'

describe Ruboty::Handlers::Talk do
  let(:robot) { Ruboty::Robot.new }

  describe '#talk' do
    let(:said) do
      "@#{robot.name} talk goro"
    end

    let(:replied) do
      'goro #すごい広島'
    end

    let(:to) do
      'alice'
    end

    let(:from) do
      'bob'
    end

    it 'return goro from talk goro' do
      allow(robot).to receive(:say).with(
        body: replied,
        from: to,
        to: from,
        original: {
          body: said,
          from: from,
          robot: robot,
          to: to,
        }
      )
      robot.receive(body: said, from: from, to: to)
    end
  end
end
