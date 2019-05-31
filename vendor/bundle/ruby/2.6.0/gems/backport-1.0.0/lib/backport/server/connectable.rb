module Backport
  module Server
    # A mixin for Backport servers that communicate with clients.
    #
    # Connectable servers check clients for incoming data on each tick.
    #
    module Connectable
      def tick
        mutex.synchronize do
          clients.each(&:tick)
          clients.delete_if(&:stopped?)
        end
      end

      def starting
        clients.map(&:run)
      end

      def stopping
        clients.map(&:stop)
      end

      # @return [Array<Client>]
      def clients
        @clients ||= []
      end

      private

      def mutex
        @mutex ||= Mutex.new
      end
    end
  end
end
