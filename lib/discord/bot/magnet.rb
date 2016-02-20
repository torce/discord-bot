require_relative '../format'

module Discord
  class MagnetLink
    include Discord::Format

    def mount(bot)
      bot.message(starting_with: 'magnet:?') do |event|
        event.respond(magnet_to_link(event.text))
      end
    end

    private
      def magnet_params(magnet)
        Hash[*magnet[8..magnet.length].split('&').flat_map {|p| p.split '='}]
      end

      def info_hash(xt)
        xt.split(':')[-1].upcase
      end

      def magnet_to_link(magnet)
        params = magnet_params magnet
        %Q(
        #{F.b(URI.decode(params['dn'].gsub('+', '%20')))}
        http://torcache.net/torrent/#{info_hash(params['xt'])}.torrent
        )
      end
  end
end
