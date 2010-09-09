class Welcome
  
  include Cinch::Plugin
  
  def initialize(*args)
     super
  end
  
  $help_messages << "!channel_help <nick>    Info about the channel"
  match /channel_help (.+)/, method: :channel_help
  
  def channel_help(m, nick)
    m.user.send "Welcome to the ECRuby IRC chat channel."
  end
  
end