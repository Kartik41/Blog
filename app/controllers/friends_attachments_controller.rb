class FriendsAttachmentsController < ApplicationController
  before_action :set_friends_attachment, only: %i[ show edit update destroy ]

  # GET /friends_attachments or /friends_attachments.json
  def index
   # @friends_attachments = FriendsAttachment.all
   respond_to do |format|
    format.html
    format.js { render json: FriendsDatatable.new(view_context) }
  end
  end

  # GET /friends_attachments/1 or /friends_attachments/1.json
  def show
  end

  # GET /friends_attachments/new
  def new
    @friends_attachment = FriendsAttachment.new
  end

  # GET /friends_attachments/1/edit
  def edit
  end

  # POST /friends_attachments or /friends_attachments.json
  def create
    @friends_attachment = FriendsAttachment.new(friends_attachment_params)

    respond_to do |format|
      if @friends_attachment.save
        format.html { redirect_to @friends_attachment, notice: "Friends attachment was successfully created." }
        format.json { render :show, status: :created, location: @friends_attachment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @friends_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /friends_attachments/1 or /friends_attachments/1.json
  def update
    respond_to do |format|
      if @friends_attachment.update(friends_attachment_params)
        format.html { redirect_to @friends_attachment, notice: "Friends attachment was successfully updated." }
        format.json { render :show, status: :ok, location: @friends_attachment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @friends_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friends_attachments/1 or /friends_attachments/1.json
  def destroy
    @friends_attachment.destroy
    respond_to do |format|
      format.html { redirect_to friends_attachments_url, notice: "Friends attachment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friends_attachment
      @friends_attachment = FriendsAttachment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def friends_attachment_params
      params.require(:friends_attachment).permit(:friend_id, :avatar)
    end
end
