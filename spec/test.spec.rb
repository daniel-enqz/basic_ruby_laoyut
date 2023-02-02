require_relative '../lib/node_2.0'

describe 'LinkedList' do
  let(:list) { LinkedList.new }

  context 'CRUD' do
    describe '#append' do
      it 'adds a node to the end of the list' do
        list.append(1)
        list.append(2)
        list.append(3)

        expect(list.head.value).to eq 1
        expect(list.head.next_node.value).to eq 2
        expect(list.head.next_node.next_node.value).to eq 3
      end
    end

    describe '#append_after' do
      it 'adds a node after a given node' do
        list.append(1)
        list.append(2)
        list.append(3)

        list.append_after(2, 4)

        expect(list.head.value).to eq 1
        expect(list.head.next_node.value).to eq 2
        expect(list.head.next_node.next_node.value).to eq 4
        expect(list.head.next_node.next_node.next_node.value).to eq 3
      end
    end

    describe '#find' do
      it 'finds a node by value' do
        list.append(1)
        list.append(2)
        list.append(3)

        expect(list.find(2).value).to eq 2
      end
    end

    describe '#delete' do
      it 'deletes a node by value' do
        list.append(1)
        list.append(2)
        list.append(3)

        list.delete(2)

        expect(list.head.value).to eq 1
        expect(list.head.next_node.value).to eq 3
      end
    end

    describe '#find_tail' do
      it 'finds the last node' do
        list.append(1)
        list.append(2)
        list.append(3)

        expect(list.find_tail.value).to eq 3
      end
    end
  end
end
