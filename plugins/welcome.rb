class Welcome
  
  include Cinch::Plugin
  
  def initialize(*args)
     super
  end
  
  if File.exist?("message.txt")
    File.open("message.txt").each { |line|
      $help_messages << line
    }
  end
  
  $white_list = ["#{$bot_name}"]
  
  if File.exist?("regulars.txt")
    File.open("regulars.txt").each { |line|
      $white_list << line.chomp
    }
  end
  
  listen_to :join
  
  def listen(m)
    unless $white_list.include?(m.user.nick) 
      welcome_message(m)
    end
  end
  
  def welcome_message(m)
    m.reply "Welcome to the #{$channel} IRC chat channel."
    m.reply "Type '!help' to recieve more information about the channel."
  end
  
end