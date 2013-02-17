require 'spec_helper'

describe 'perlbrew::params' do
  let :facts do
    { :osfamily => 'Debian' }
  end

  it { should include_class('perlbrew::params') }

end
