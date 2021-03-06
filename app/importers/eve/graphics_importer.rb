# frozen_string_literal: true

module Eve
  class GraphicsImporter < BaseImporter
    def import
      import! do
        return if esi.not_modified?

        import_new_graphics

        remove_old_graphics

        update_etag
      end
    end

    def esi
      @esi ||= EveOnline::ESI::UniverseGraphics.new
    end

    private

    def import_new_graphics
      esi.graphic_ids.each do |graphic_id|
        unless Eve::Graphic.exists?(graphic_id: graphic_id)
          Eve::UpdateGraphicJob.perform_later(graphic_id)
        end
      end
    end

    def remove_old_graphics
      eve_graphic_ids = Eve::Graphic.pluck(:graphic_id)

      graphic_ids_to_remove = eve_graphic_ids - esi.graphic_ids

      graphic_ids_to_remove.each do |graphic_id|
        eve_graphic = Eve::Graphic.find_or_initialize_by(graphic_id: graphic_id)

        eve_graphic.destroy!
      end
    end
  end
end
