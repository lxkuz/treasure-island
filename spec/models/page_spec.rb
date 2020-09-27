require 'rails_helper'

describe Page, type: :model do
  let(:child_path) { 'child-path' }
  let(:parent) { create :page, path: 'test-path', name: 'Dr Parent' }

  context 'when has children' do
    let!(:child) { create :page, parent: parent, path: child_path, name: 'Dr Child' }

    context 'with path changes' do
      let(:new_parent_path) { 'new-test-path' }
      let(:new_child_full_path) { "#{new_parent_path}/#{child_path}" }

      before { parent.update(path: new_parent_path) }

      it 'updates children full paths' do
        expect(child.reload.full_path).to eq(new_child_full_path)
      end
    end

    context 'with #key' do
      let(:child_key) { 'dr_parent.dr_child' }
      let(:parent_key) { 'dr_parent' }

      it 'parent has correct key' do
        expect(parent.reload.key).to eq(parent_key)
      end

      it 'child has correct key' do
        expect(child.reload.key).to eq(child_key)
      end
    end
  end
end
