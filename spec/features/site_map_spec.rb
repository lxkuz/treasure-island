require 'rails_helper'

describe 'Site Map', type: :feature, js: true do
  include_context 'with seed based data'

  it 'respons site_map structure' do
    visit root_path
    wait_a_bit
    expect(page.body).to include site_map_content
  end

  private

  def site_map_content
    load_html_content('site_map')
  end

  def load_html_content(filename)
    File.read(Rails.root.join('spec', 'fixtures', "#{filename}.html")).gsub(/>\n*\t*\s*</, '><')
  end

  def wait_a_bit
    waiting_time = 1
    sleep(waiting_time)
  end
end
