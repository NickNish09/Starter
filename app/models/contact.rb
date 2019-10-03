class Contact < ApplicationRecord
  validate :check_record, on: :create #please not that validate in this case is singular

  def check_record
    Contact.test
    if Contact.all.count >= 1
      errors[:base] << "You can only have one active contact"
    end
  end

  def self.test
    puts "Test"
  end
end
