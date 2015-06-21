module HasStar
  module Helper
    def toggle_star(model)
      link_to (model.star? ? '&#x2605;' : '&#9734;').html_safe,
              [:toggle_star, model],
              method: :patch,
              remote: true,
              id: dom_id(model, :toggle_star),
              class: 'toggle-star'
    end
  end
end
