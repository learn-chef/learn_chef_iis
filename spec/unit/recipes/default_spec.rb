#
# Cookbook Name:: learn_chef_iis
# Spec:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'learn_chef_iis::default' do
  context 'When all attributes are default, on an unspecified platform' do
    before do
      stub_command('(Get-WindowsFeature -Name Web-Server).Installed').and_return(false)
    end

    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'windows', version: '2012R2')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
