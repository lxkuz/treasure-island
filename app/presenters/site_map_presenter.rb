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
    site_map = { nodes: {} }
    data.find_each do |node|
      node_keys = node.key.split('.')
      if node_keys.one?
        site_map.merge!(render_node(node))
      else
        parent_node = find_parent_node(site_map, node_keys)
        parent_node[:nodes][build_key(node)] = render_node(node)
      end
    end
    site_map
  end

  private

  attr_reader :data

  def find_parent_node(site_map, node_keys)
    parent_node = site_map
    node_keys[1..-2].each do |node_key|
      parent_node = parent_node[:nodes][node_key]
    end
    parent_node
  end

  def render_node(node)
    {
      path: node.path,
      full_path: node.full_path,
      key: node.key,
      name: node.name,
      nodes: {}
    }
  end

  def build_key(node)
    node.name.parameterize.underscore
  end
end
