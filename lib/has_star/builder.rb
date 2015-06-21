module HasStar
  # take logic out of has_star helper method
  # makes it easy to override
  class Builder < ::Struct.new(:model, :h)
    # content based on model.star status, already html safed
    def content
      (model.star? ? starred : unstarred).html_safe
    end

    # html code for solid star
    def starred
      '&#x2605;'
    end

    # html code for empty star
    def unstarred
      '&#9734;'
    end

    # /posts/980190962/toggle_star
    def url
      [:toggle_star, model]
    end

    # has_star_post_980190962
    def id
      h.dom_id(model, :has_star)
    end

    # override to add extra classes
    def classes
      'has-star'
    end

    def render
      h.link_to content, url, method: :patch, remote: true, id: id, class: classes
      # data: {disable_with: '<span class="toggle-star-loading">&#8635;</span>'},
    end

    def to_s
      render
    end
  end
end
