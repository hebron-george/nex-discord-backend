class Quote < ApplicationRecord
  scope :search, -> (keyword) { where(arel_table[:message].matches("%#{keyword}%")).order("RANDOM()") }

  Message = Struct.new(:author, :saved_at, :channel, :message, keyword_init: true)

  def self.find_quote(search_keyword:)
    results = Quote.search(search_keyword)
    return nil if results.count.zero?

    result = results.last
    Message.new(
      author:   result.quote_submitter,
      saved_at: result.created_at,
      channel:  result.channel,
      message:  result.message
    )
  end
end
