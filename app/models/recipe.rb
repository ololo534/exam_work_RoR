# frozen_string_literal: true

class Recipe < ApplicationRecord
  has_many :specifications
  has_attached_file :avatar, styles: { medium: '300x300>' }, default_url: 'app/assets/images/missing.png'
end
