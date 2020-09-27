RSpec.shared_context 'with seed based data' do
  before { generate_pages! }

  private

  def generate_pages!
    Rails.application.load_seed
  end
end
