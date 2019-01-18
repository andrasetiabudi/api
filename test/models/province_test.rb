require 'test_helper'

class ProvinceTest < ActiveSupport::TestCase
  def setup
    @new_record = Province.new
  end

  test 'valid record' do
    @new_record.assign_attributes(
      name: 'Aceh', abbreviation: 'AC', anno: Date.parse('07-12-1959'), total_area: 57365
    )
    @new_record.save


    assert_valid @new_record
    assert_equal true, @new_record.id.present?
  end

  test 'presence validations' do
    @new_record.valid?

    attrs = [:name, :anno]

    attrs.each do |att|
      assert_equal true, @new_record.errors.messages.key?(att)
    end 
  end

  test 'attributes' do
    assert_respond_to @new_record, :name
    assert_respond_to @new_record, :abbreviation
    assert_respond_to @new_record, :anno
    assert_respond_to @new_record, :total_area
  end
end

class Province < ApplicationRecord
  validates_presence_of :name, :anno
end