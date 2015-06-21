module HasStar
  module Helper
    def has_star(model)
      Builder.new(model, self)
    end
  end
end
