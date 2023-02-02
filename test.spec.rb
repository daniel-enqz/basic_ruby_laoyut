require_relative "node"

describe "LinkedList" do
  let(:list) { LinkedList.new }

  describe "#append" do
    it "adds a new node to the end of the list" do
      list.append(10)
      expect(list.head.value).to eq(10)
    end
  end

  describe "#append_after" do
    it "adds a new node after the target node" do
      list.append(10)
      list.append(20)
      list.append(30)
      list.append_after(20, 25)

      expect(list.head.next_node.next_node.value).to eq(25)
    end
  end

  describe "#find" do
    it "returns the node with the given value" do
      list.append(10)
      list.append(20)
      list.append(30)

      expect(list.find(20).value).to eq(20)
    end
  end

  describe "#print" do
    it "prints out each value in the list" do
      list.append(10)
      list.append(20)
      list.append(30)

      expect { list.print }.to output("10 -> 20 -> 30").to_stdout
    end
  end
end
