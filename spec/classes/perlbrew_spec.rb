require 'spec_helper'

describe 'perlbrew' do

  let :facts do
    { :osfamily => 'Debian' }
  end

  it { should include_class('perlbrew') }

end
