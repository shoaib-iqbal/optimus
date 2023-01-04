class BillsController < ApiController
  before_action :set_bill, only: [:upvote, :downvote]

  def index
    @bills = Bill.all
    render json: @bills
  end

  def upvote
    @bill.upvote @current_user
    render json: { upvotes: @bill.get_upvotes.count, downvotes: @bill.get_downvotes.count }
  end

  def downvote
    @bill.downvote @current_user
    render json: { upvotes: @bill.get_upvotes.count, downvotes: @bill.get_downvotes.count }
  end

  private

  def set_bill
    @bill = Bill.find_by(parliament_id: params[:id])
  end
end
