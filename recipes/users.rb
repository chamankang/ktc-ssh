#
# Cookbook Name:: ktc-ssh
# Recipe:: users
#
# Chaman Kang <chaman.kang@ktcloudware.com>

include_recipe "openssh"
include_recipe "users"

KTC::User.node = node

users = KTC::User.all_users
ssh_users = KTC::User.get_setup_users(users, "ssh")
if ssh_users != nil and !ssh_users.empty?
  ssh_users.each do |u|
    u = KTC::User.get_user(u)
    home_dir = KTC::User.get_home(u)
    if home_dir
      # makes sure home dir exists (because we dunno)
      directory home_dir do
        owner u['id']
        group u['groups'].first
        mode "0750"
        not_if { File.directory? home_dir }
      end

      directory "#{home_dir}/.ssh" do
        owner u['id']
        group u['groups'].first
        mode "0700"
        action :create
      end

      template "#{home_dir}/.ssh/authorized_keys" do
        source "authorized_keys.erb"
        owner u['id']
        group u['groups'].first
        mode "0600"
        variables :ssh_keys => u['ssh_keys']
      end
    else
      Chef::Log.info "User's home_dir is not set. Authorized keys not laid down"
    end
  end
end
