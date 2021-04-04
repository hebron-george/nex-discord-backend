class QuotesController < ApplicationController

  def find_quote
    if params[:keyword].present?
      message = Quote.search(params[:keyword]).sample.message
    else
      message = Quote.order("RANDOM()").last.message
    end

    render json: {status: 'SUCCESS', message: 'Found a quote', data: {quote: message}}, status: :ok
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