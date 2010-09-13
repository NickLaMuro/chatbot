class Welcome
  
  include Cinch::Plugin
  
  def initialize(*args)
     super
  end
  
  listen_to :join
  
  def listen(m)
    channel_help(m)
  end
  
  $help_messages << "Again, we welcome you to the ECRuby IRC channel!"
  $help_messages << "Feel free to ask questions about the ruby programming language and related technologies."
  $help_messages << "Most of the members are usually busy with work and other projects, " +
  "but if you type someones user ('welcome_bot hello'), it will get there attention."
  
  def welcome_message(m)
    m.reply "Welcome to the ECRuby IRC chat channel."
    m.reply "Type '!help' to recieve more information about the channel."
  end
  
end