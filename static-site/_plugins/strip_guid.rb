module Jekyll
  module StripGUID
    def strip_guid(input)
      "STRIP GUID(#{input})"
    end
  end
end

Liquid::Template.register_filter(Jekyll::StripGUID)
