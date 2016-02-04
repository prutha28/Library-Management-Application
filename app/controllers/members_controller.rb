class MembersController < ApplicationController
  before_action :confirm_logged_in, :except => [:new, :create]
  #before_action :set_member, only: [:show, :edit, :update, :destroy]

  # GET /members
  # GET /members.json
=begin
  def index
    #@members = Member.search(params[:author], params[:title], params[:isbn], params[:status])
    @members = Member.all
  end

  # GET /members/1
  # GET /members/1.json
  def show
    #flash[:notice] = "Login now"
    #redirect_to(:controller => 'access',:action => 'login')
    @member = User.find(params[:id])
  end
=end
  # GET /members/new
  def new
#    @member = Member.new
    @member = User.new
  end

  # GET /members/1/edit
  def edit
  end

  # POST /members
  # POST /members.json
  def create
    @member = User.new(member_params)
    #@member = Member.new(member_params)

    respond_to do |format|
      if @member.save
#        render plain: params[:user].inspect
        #redirect_to @member
        format.html { redirect_to @member, notice: 'Member was successfully created.' }
        format.json { render :show, status: :created, location: @member }
      else
        format.html { render :new }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to @member, notice: 'Member was successfully updated.' }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member.destroy
    respond_to do |format|
      format.html { redirect_to members_url, notice: 'Member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def showbook
    @book = Book.all

  end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.require(:user).permit(:first_name, :last_name, :email, :user_type, :username, :password)
      #params.require(:user).permit(:first_name, :last_name, :email, :user_type, :username, :password)
    end
end
