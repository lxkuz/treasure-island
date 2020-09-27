require 'rails_helper'

describe 'Site Map API v1', type: :request do
  include_context 'with seed based data'

  before { get '/api/v1/site_map' }

  it 'responses JSON' do
    expect(response.content_type).to eq('application/json; charset=utf-8')
  end

  it 'response is successful' do
    expect(response).to have_http_status(:success)
  end

  it 'responses correct site map JSON structure' do
    expect(JSON.parse(response.body)).to eq(json_site_map)
  end

  private

  def json_site_map
    load_json('site_map')
  end

  def load_json(filename)
    path = Rails.root.join('spec', 'fixtures', "#{filename}.json")
    JSON.parse(File.read(path))
  end
end
