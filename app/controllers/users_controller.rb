class UsersController < ApplicationController
  # authorize_resource
  before_filter :authenticate_user!
  
  def index
  puts current_user
    if current_user.is_admin?
    puts current_user.is_admin?
    puts current_user.username
      @users = User.alphabetical.paginate(:page => params[:page]).per_page(10)
    else
      redirect_to user_path(current_user), error: "You do not have permission to view all system users."
    end
  end

  def show
    if current_user.is_admin?
      @user = User.find(params[:id])
    else
      @user = current_user
    end
  end

  def new
    @user = User.new
  end

  def edit
    if current_user.is_admin?
      @user = User.find(params[:id])
    else
      @user = current_user
    end
  end

  def create
    if current_user.is_admin?
      @user = User.new(params[:user])
      @pswd = params[:user][:password]
      puts '++++++++++++++++++++++++++++++++++++++++++'
      puts @user
      if @user.save
        ### moved to callback to handle emails with db:add_user rake task
        # PostOffice.new_user_msg(@user, @pswd).deliver  
        redirect_to users_path, notice: "#{@user.proper_name} is registered."
      else
        flash[:error] = "This user could not be created."
        render "new"
      end
    else
      redirect_to user_path(current_user), error: "You do not have permission to create users."
    end
    
  end

  def update
    if current_user.is_admin?
      @user = User.find(params[:id])
    else
      # if not admin, limit user to current_user
      @user = current_user
      # also limit role to checkin
      params[:user][:role] = "checkin"
    end
    if @user.update_attributes(params[:user])
      if current_user.is_admin?
        redirect_to users_path, notice: "#{@user.proper_name} is updated."
      else
        redirect_to user_path(@user), notice: "Your information was updated."
      end
      
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "Removed #{@user.proper_name} from the system."
    redirect_to admin_path
  end
end
