# Site map node entity
#
class Page < ApplicationRecord
  belongs_to :parent, class_name: 'Page', optional: true
  has_many :children, class_name: 'Page', foreign_key: :parent_id

  validates :name, uniqueness: true, presence: true

  before_save :setup_full_path
  after_save :update_children

  protected

  def setup_full_path
    self.full_path = if parent
                       parent_path = parent.full_path
                       "#{parent_path.last == '/' ? parent_path : parent_path + '/'}#{path}"
                     else
                       path
                     end
  end

  def update_children
    children.each(&:save) if saved_change_to_full_path?
  end
end
