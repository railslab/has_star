module HasStar
  module Controller
    def toggle_star
      has_star_resource.toggle_star!
      render_star
    end

    protected

    def render_star
      render inline: <<-EOF
        <% builder = HasStar::Builder.new(@has_star_resource, self) %>
        $('#<%= builder.id %>')
        .html('<%= builder.content %>')
        .blur()
      EOF
    end

    def has_star_resource
      @has_star_resource ||= send self.class.has_star_resource_method
    end
  end
end
