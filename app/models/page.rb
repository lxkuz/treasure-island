class Page < ApplicationRecord
  belongs_to :parent, class_name: 'Page', optional: true
  
  validates :path, :name, presence: true
  validates :name, uniqueness: true

end
