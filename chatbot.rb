require 'rubygems'
require 'cinch'
require 'yaml'

settings = YAML.load(File.read("bot.yml"))
$help_messages = ["Channel information:"]
$channel = settings["settings"]["channel"]
$bot_name = settings["settings"]["nick"]

require 'plugins/welcome'

@irc  = Cinch::Bot.new do
  
  configure do |c|
    c.server = "irc.freenode.org"
    c.nick = $bot_name
    c.channels = ["##{$channel}"]
    c.plugins.plugins = [Welcome]
  end

  on :message, /^!help/ do |m|
    $help_messages.each{|message| m.reply message }
  end

end

@irc.start
