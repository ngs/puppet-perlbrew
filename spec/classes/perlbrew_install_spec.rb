require 'spec_helper'

describe 'perlbrew::install' do

  #it { should include_class('perlbrew::install') }

  #it { should contain_package('wget').with(
  #  'ensure' => 'present'
  #)}

  describe 'Testing for Debian' do
    let :facts do
      { :osfamily => 'Debian'}
    end
    it { should contain_package('build-essential').with(
      :name   => 'build-essential',
      :ensure => 'present'
    )}
  end

  describe 'Testing for RedHat' do
    let :facts do
      { :osfamily => 'RedHat'}
    end
    it { should contain_package('gcc').with(
      :name   => 'gcc',
      :ensure => 'present'
    )}
    it { should contain_package('gcc-c++').with(
      :name   => 'gcc-c++',
      :ensure => 'present'
    )}
    it { should contain_package('make').with(
      :name   => 'make',
      :ensure => 'present'
    )}
    describe 'Testing build_pkg parameter' do
      let :params do
        { :build_pkgs => 'hello'}
      end
      it { should contain_package('hello').with(
        :name   => 'hello',
        :ensure => 'present'
      )}
    end
  end

end
