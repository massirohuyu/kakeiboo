class Api::EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :update, :destroy]

  permits :action_date,
          :item_id,
          :detail_id,
          :amount,
          :description,
          :input_user_id,
          :book_id

  # GET /entries
  def index
    @entries = Entry.all
    @entries.includes([:item, :detail, :input_user, :book])
  end

  # GET /entries/1
  def show
  end

  # POST /entries
  def create(entry)
    @entry = Entry.new(entry)

    if @entry.save
      render :show, status: :created
    else
      render json: @entry.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /entries/1
  def update(entry)
    if @entry.update(entry)
      render :show, status: :ok
    else
      render json: @entry.errors, status: :unprocessable_entity
    end
  end

  # DELETE /entries/1
  def destroy
    @entry.destroy
    head :no_content
  end

  private
    def set_entry
      @entry = Entry.find(params[:id])
    end
end
