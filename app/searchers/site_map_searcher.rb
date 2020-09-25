# Site map data structure searcher
#
class SiteMapSearcher
  def self.call
    Page.reorder(:key)
  end
end
