require 'rubygems'
require 'cinch'
require 'yaml'

settings = YAML.load(File.read("bot.yml"))
$help_messages = []

require 'plugins/welcome'

@irc  = Cinch::Bot.new do
  
  configure do |c|
    c.server = "irc.freenode.org"
    c.nick = settings["settings"]["nick"]
    c.channels = ["##{settings['settings']['channel']}"]
    c.plugins.plugins = [Welcome]
  end

  on :message, /^!help/ do |m|
    $help_messages.each{|message| m.user.send message }
  end

end

@irc.start
