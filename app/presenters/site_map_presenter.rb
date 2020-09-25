# Site map tree data structure presenter
#
class SiteMapPresenter
  def self.call(data)
    new(data).call
  end

  def initialize(data)
    @data = data
  end

  def call
    data.each_with_object({}) do |node, site_map|
      paths = node.full_path.split('/')
      if node.full_path == '/' || paths.one?
        site_map.merge!(render_node(node))
      else
        parent_node = find_parent_node(site_map, paths)
        parent_node[:children][node.path] = render_node(node)
      end
    end
  end

  private

  attr_reader :data

  def find_parent_node(site_map, paths)
    parent_node = site_map
    paths[1..-2].each do |path|
      parent_node = parent_node[:children][path]
    end
    parent_node
  end

  def render_node(node)
    {
      path: node.path,
      full_path: node.full_path,
      name: node.name,
      children: {}
    }
  end
end
