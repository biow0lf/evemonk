# frozen_string_literal: true

module Eve
  class BaseImporter
    def import!
      configure_middlewares

      configure_etag

      ActiveRecord::Base.transaction do
        yield if block_given?
      end
    end

    def esi
      raise NotImplementedError
    end

    def import
      raise NotImplementedError
    end

    def etag
      @etag ||= EtagRepository.find_by_url(esi.url)
    end

    private

    def configure_middlewares
      esi.add_middleware(statistics_middleware)

      esi.add_middleware(cool_down_middleware)
    end

    def configure_etag
      esi.etag = etag.etag
    end

    def update_etag
      input = EtagInput.new(url: esi.url, etag: esi.etag, body: esi.response)

      EtagRepository.update_by_url(esi.url, input)
    end

    def statistics_middleware
      {
        class: StatisticsMiddleware,
        esi: esi
      }
    end

    def cool_down_middleware
      {
        class: CoolDownMiddleware,
        esi: esi
      }
    end
  end
end
