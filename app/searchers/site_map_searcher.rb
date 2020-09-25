# Site map data structure searcher
#
class SiteMapSearcher
  def self.call
    Page.reorder(:full_path)
  end
end
