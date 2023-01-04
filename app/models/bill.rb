class Bill < ApplicationRecord
  acts_as_votable

  def self.save_bills
    results = BillsService.new.get_all_bills
    skip_records = 1000
    while results["items"].any?
      results["items"].each do |bill| 
        new_bill = Bill.find_or_initialize_by(parliament_id: bill['billId'])
        new_bill.short_title = bill['shortTitle']
        new_bill.stage_date = bill['currentStage']['stageSittings'].first['date'].to_datetime rescue nil
        new_bill.save
      end
      results = BillsService.new.get_all_bills skip_records
      skip_records += 1000
    end
  end


  def upvote(user)
    liked_by user
  end

  def downvote(user)
    downvote_from user
  end
end
