class FriendsController < ApplicationController
  before_action :set_friend, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /friends or /friends.json
  def index
    #@friends = Friend.all
   
    respond_to do |format|
      format.html
      format.js { render json: FriendsDatatable.new(view_context) }
    end
  end

  # GET /friends/1 or /friends/1.json
  def show
  end

  # GET /friends/new
  def new
    @friend = Friend.new
    #@friends_attachment = @friend.friends_attachments.build
    #respond_to do |format|
     # format.js
    #end
  end

  # GET /friends/1/edit
  def edit
    @friends = Friend.find(params[:id])
    respond_to do |format|
      format.html { render :file => "friends/edit.html.erb" }
    end
    #@friends_attachment = @friends.friends_attachments.find_by_id(:id)
    
  end

  # POST /friends or /friends.json
  def create
    @friend = Friend.new(friend_params)

    respond_to do |format|
      if @friend.save
        #params[:friends_attachments]['avatar'].each do |a|
         # @friends_attachment = @friend.friends_attachments.create!(:avatar => a,     :friend_id => @friend.id)
       #end
      #format.js { render :file => "friends/create.js.erb", locals: {:message => "New Friend Created Successfully"}} 
        format.html { redirect_to @friend, notice: "Friend was successfully created." }
        format.json { render :show, status: :created, location: @friend }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /friends/1 or /friends/1.json
  def update
    respond_to do |format|
      if @friend.update(friend_params)
        format.html { redirect_to @friend, notice: "Friend was successfully updated." }
        format.json { render :show, status: :ok, location: @friend }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friends/1 or /friends/1.json
  def destroy
    @friend.destroy
    respond_to do |format|
      format.html { redirect_to friends_url, notice: "Friend was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  #def search
    #if params[:search].blank?  
     # redirect_to(root_path) and return  
    #else  
     # friends = Friend.find(params[:search])  
      #respond_to do |format|
       # format.html
        #format.js
      #end

    #end 

  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friend
      @friend = Friend.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def friend_params
      params.require(:friend).permit(:first_name, :last_name, :email, :phone, :twitter, :age, :gender)
      #, post_attachments_attributes: 
      #[:id, :post_id, :avatar])
    end
end
