pages_data = [
  ['Home', '/', nil],
  ['Settings', 'settings', 'Home'],
  ['Company Profile', 'company_profile', 'Settings'],
  ['Switches', 'switches', 'Settings'],
  ['Help', 'help', 'Home'],
  ['Tickets', 'tickets', 'Help'],
  ['Create A Ticket', 'create', 'Tickets'],
  ['FAQ', 'faqs', 'Help']
]

def create_page(name, path, parent_name)
  Page.create!(
    name: name,
    path: path,
    parent_id: parent_id(parent_name)
  )
end

def parent_id(parent_name)
  return nil unless parent_name

  Page.find_by_name(parent_name).id
end

pages_data.each do |(name, path, parent_name)|
  create_page(name, path, parent_name)
end
