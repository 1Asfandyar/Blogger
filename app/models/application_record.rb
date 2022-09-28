# frozen_string_literal: true

# all models inherits from this
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
