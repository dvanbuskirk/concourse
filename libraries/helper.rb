module Fly
  module Helper

    include Chef::Mixin::ShellOut

    def login(concourse_url, fly_executable, username, password, insecure)
      tries ||= 5
      command = "#{fly_executable} -t l login -u #{username} -p #{password} -c #{concourse_url}"
      command = command.to_s + ' -k' if insecure
      cmd = Mixlib::ShellOut.new(command)
      cmd.live_stream = STDOUT
      cmd.run_command
      begin
        cmd.error!
      rescue Mixlib::ShellOut::ShellCommandFailed => e
        if (tries -= 1) > 0
          sleep 5
          Chef::Log.debug('Unable to log into Concourse via fly, Retrying...')
          cmd = Mixlib::ShellOut.new(command)
          cmd.live_stream = STDOUT
          cmd.run_command
          retry
        else
          Chef::Log.fatal('Unable to initiate Concourse login via fly!')
        end
      else
        Chef::Log.debug('Concourse login via fly Successful!')
      end
    end
  end
end