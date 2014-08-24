class UsersController < ApplicationController


  def login
    oauth = request.env["omniauth.auth"]
    @user = User.find_by_uid(oauth['uid'])
    #session['fb_auth'] = oauth
    session['fb_access_token'] = oauth['credentials']['token']
    session['fb_error'] = nil


    if  @user.nil? || !@user.username.present? 
      @user = User.create_with_omniauth(oauth)
    end
    @user.fb_access_token = oauth['credentials']['token']
    @user.save
    sign_in @user
    @graph = Koala::Facebook::API.new(@user.fb_access_token)
    @friends = @graph.get_connections("me", "friends")
    create_fb_friends @friends
    sign_in @user
    redirect_to root_path
  end

  def friends
    @friends = current_user.friends.paginate(:page => params[:page], :per_page => 8)
  end

  def page_friends
    @friends = current_user.friends.paginate(:page => params[:page], :per_page => 8)
  end

  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
