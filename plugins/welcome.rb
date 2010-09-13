class Welcome
  
  include Cinch::Plugin
  
  def initialize(*args)
     super
  end
  
  # in the works
  # match /#{$bot_name} /, method: :bot_ping
    
  if File.exist?("message.txt")
    File.open("message.txt").each { |line|
      $help_messages << line
    }
  end
  
  listen_to :join
  
  def listen(m)
     welcome_message(m)
  end
  
  def welcome_message(m)
    m.reply "Welcome to the #{$channel} IRC chat channel."
    m.reply "Type '!help' to recieve more information about the channel."
  end
  
  # in the works
  # def bot_ping(m)
  #     m.user.send "Pinging me won't get you any help."
  #   end
  
end