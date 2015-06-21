module HasStar
  module Route
    def has_star(controller)
      patch "/#{controller}/:id/toggle_star" => "#{controller}#toggle_star",
            as: "toggle_star_#{controller.to_s.singularize}"

      get "/#{controller}/starred" => "#{controller}#starred",
          as: "starred_#{controller}"

      get "/#{controller}/unstarred" => "#{controller}#unstarred",
          as: "unstarred_#{controller}"
    end
  end
end
