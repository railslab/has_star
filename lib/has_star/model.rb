module HasStar
  module Model
    extend ActiveSupport::Concern

    def toggle_star!
      self.class.record_timestamps = false
      toggle! :star
      self.class.record_timestamps = true
    end

    included do
      scope :starred,   -> { where star: true  }
      scope :unstarred, -> { where star: false }
    end
  end
end
