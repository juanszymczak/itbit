module Itbit
  class SpecieDeposit
    # @!attribute id
    #   @return [Integer] This SpecieDeposit's unique ID.
    attr_accessor :id

    # @!attribute created_at
    #   @return [Time] Time when this deposit credited.
    attr_accessor :created_at

    # @!attribute specie
    #   @return [Symbol] :btc or :ltc
    attr_accessor :specie

    # @!attribute quantity
    #   @return [BigDecimal] Quantity deposited
    attr_accessor :quantity

    # @visibility private
    def self.from_json(json)
      Api.from_json(new, json, true) do |thing|
        thing.quantity = BigDecimal.new(json[4].to_s)
      end
    end

    def self.find(specie, id)
      from_json(Api.private(:get, "/private/#{specie}/deposits/#{id}"))
    end

    def self.all(specie)
      Api.private(:get, "/private/#{specie}/deposits").collect{|x| from_json(x) }
    end
  end
end
