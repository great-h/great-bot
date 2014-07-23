require "spec_helper"
require "handlers/sudden"

describe Ruboty::Handlers::Sudden do
  let(:sudden) { Ruboty::Handlers::Sudden.new(nil) }
  describe "#suddenize" do
    subject { sudden.suddenize("すごい広島") }
    let(:result) do
      <<-STRING.chop
＿人人人人人人人＿
＞　すごい広島　＜
￣ＹＹＹＹＹＹＹ￣
      STRING
    end
    it { is_expected.to eq(result) }
  end
end
