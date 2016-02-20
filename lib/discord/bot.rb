require 'discordrb'
require 'uri'
require_relative 'format'
require_relative 'bot/magnet'
require_relative 'bot/music'

module Discord
  module Bot
    components = [
      MagnetLink.new,
      MusicPlayer.new('[channel_name]', ['http://www.mfiles.co.uk/mp3-downloads/frederic-chopin-piano-sonata-2-op35-3-funeral-march.mp3'])
    ]

    bot = Discordrb::Bot.new '[username]', '[password]'
    bot.run_async

    components.each do |component|
      component.mount bot
    end
  end
end
