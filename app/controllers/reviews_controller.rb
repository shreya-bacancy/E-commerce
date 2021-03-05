# frozen_string_literal: true

class ReviewsController < ApplicationController
    before_action :authenticate_user!
  before_action :set_review, only: %i[edit update destroy]


  # GET /reviews
  # GET /reviews.json
  def index
    @review = Review.where(product_id: params[:product_id]).joins(:user)
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
    @review = current_user.reviews
    render 'index'
  end

  # GET /reviews/new
  def new
    @order= current_user.order_details.where(product_id:params[:id],order_status:true)
    if @order.present?
      @review = Review.new
    else
      flash[:notice] = "you are not eligible to write a review"
   
      redirect_to show_product_path(params[:id])
    end

  end

  # GET /reviews/1/edit
  def edit; end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)

    respond_to do |format|
      if @review.save
        format.html { redirect_to all_review_path(params[:id]), notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to your_reviews_path, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to your_reviews_path, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_review
    @review = Review.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def review_params
    params.require(:review).permit(:user_id, :product_id, :content,:rating)
  end
end
