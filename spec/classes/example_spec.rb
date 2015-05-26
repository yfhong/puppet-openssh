require 'spec_helper'

describe 'openssh' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "openssh class without any parameters" do
          let(:params) {{ }}

          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('openssh::params') }
          it { is_expected.to contain_class('openssh::install').that_comes_before('openssh::config') }
          it { is_expected.to contain_class('openssh::config') }
          it { is_expected.to contain_class('openssh::service').that_subscribes_to('openssh::config') }

          it { is_expected.to contain_service('openssh') }
          it { is_expected.to contain_package('openssh').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'openssh class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { is_expected.to contain_package('openssh') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
