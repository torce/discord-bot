module Discord
  module Format
    #Module alias
    F = self

    @@formats = { b: '**', i: '*', u: '__', s: '~~', code: '```' }

    def self.method_missing(m, *args, &block)
      mark = @@formats[m]
      mark + args.first + mark
    end
  end
end
