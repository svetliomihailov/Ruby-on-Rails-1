require 'semantria'

module SemantriaService
  class Api
    def initialize(api_key, api_secret, application_mame, texts)
      @session = ::Semantria::Session.new(
        api_key,
        api_secret,
        application_mame,
        true
      )
      @docs = prepare_doc texts
    end

    def semantria_result
      @results = []
      queue_docs

      sleep(10)
      extract_result @session.getProcessedDocuments()

      @results
    end

    private

    def extract_result(response)
      if response.is_a? Array
        response.each { |o| save_result(o) }
      end
    end

    def save_result(result)
      d = @docs.find { |h| h[:text].eql?(result['source_text']) }
      if d.present?
        @results << {text: d[:text], polarity: result['sentiment_polarity']}
      end
    end

    def queue_docs
      @docs.map { |d| @session.queueDocument d }
    end

    def prepare_doc(texts)
      texts.map { |t| {id: SecureRandom.base64.to_s.gsub("-", ""), text: t} }
    end
  end
end