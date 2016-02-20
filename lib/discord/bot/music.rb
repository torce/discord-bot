require 'open-uri'

module Discord
  class MusicPlayer
    attr_accessor :channel_name
    attr_accessor :music_urls

    def initialize(channel, music_urls)
      @channel_name = channel
      @music_urls = music_urls
    end

    def mount(bot)
      channel = bot.find(@channel_name).first
      bot.voice_connect(channel)
      bot.voice.encoder.use_avconv = true
      @music_urls.each do |url|
        bot.voice.play_io(open(url))
      end
    end
  end
end
