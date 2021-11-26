class QuotesController < ApplicationController

  def find_quote
    message = Quote.find_quote(search_keyword: params[:keyword])
    return render status: :not_found if message.nil?

    data = {
      author:   message.author,
      saved_at: message.saved_at,
      channel:  message.channel,
      message:  message.message
    }
    render json: {status: 'SUCCESS', message: 'Found a quote', data: data}, status: :ok
  end

  def add_quote
    quote = Quote.new(add_quote_params)

    if quote.save
      render json: {status: 'SUCCESS', message: 'Saved quote', data: quote}, status: :ok
    else
      render json: {status: 'ERROR', message: 'Quote not saved', data: quote.errors}, status: :unprocessable_entity
    end
  end

  private

  def add_quote_params
    params.require(:quote).permit(:quote_submitter, :channel, :message)
  end
end
