require "spec_helper"

describe Order do
  before do
    Status.create!(title: "new")
    Status.create!(title: "assigned")
    Status.create!(title: "delayed")
    Status.create!(title: "blocked")
    Status.create!(title: "in_work")
    Status.create!(title: "completed")
    @order = Order.create!(title: "new", status_id: 1)
  end

  it "should update order via update_attributes" do
    @order.update_attributes!(status_id: 2)
    Order.last.status_id.should eq 2
  end

  it "should update order via direct assignment" do
    @order.status_id = 2
    @order.save
    Order.last.status_id.should eq 2
  end

  it "should update other fields too" do
    @order.update_attributes!(title: "updated")
    Order.last.title.should eq "updated"
    Order.last.status_id.should eq 1
  end

  it "should reject update" do
    @order.update_attributes(status_id: 5)
    @order.errors.size.should eq 1
    Order.last.status_id.should eq 1
  end
end
