module Twitter4j4r
  class StatusListener
    include Java::Twitter4j::StatusListener

    def initialize(client, blocks)
      @client = client
      @blocks = blocks
    end

    def call_block_with_client(block_key, *args)
      if block = @blocks[block_key]
        block.call(*((args + [@client])[0, block.arity]))
      end
    end

    [[ :onStatus,                 :status ],
     [ :onException,              :exception ],
     [ :onTrackLimitationNotice,  :limitation ]
    ].each do |method|
      define_method(method[0]) do |*args|
        call_block_with_client(method[1], *args)
      end
    end
  end

end

Twitter4j4r::StatusListener.become_java!
