require 'spec_helper'

describe 'weblogic' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "weblogic class without any parameters" do
          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('weblogic::params') }
          it { is_expected.to contain_class('weblogic::install').that_comes_before('weblogic::config') }
          it { is_expected.to contain_class('weblogic::config') }
          it { is_expected.to contain_class('weblogic::service').that_subscribes_to('weblogic::config') }

          it { is_expected.to contain_service('weblogic') }
          it { is_expected.to contain_package('weblogic').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'weblogic class without any parameters on Solaris/Nexenta' do
      let(:facts) do
        {
          :osfamily        => 'Solaris',
          :operatingsystem => 'Nexenta',
        }
      end

      it { expect { is_expected.to contain_package('weblogic') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
