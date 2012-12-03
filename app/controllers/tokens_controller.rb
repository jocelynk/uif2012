class TokensController  < ApplicationController
    skip_before_filter :verify_authenticity_token
    before_filter :skip_trackable, :cors_preflight_check
    after_filter :cors_set_access_control_headers
    
    respond_to :json 
    def create
      login = params[:email]
      password = params[:password]

      if login.nil? or password.nil?
         respond_to do |format|

          format.json { render :json=>{:message=>"Please enter your login and password."}, :callback => params[:callback] }
         end
      end

    @user=User.where("users.email = ? OR users.username = ?", login, login).first

      if @user.nil?
        logger.info("User #{login} failed signin, user cannot be found.")
        respond_to do |format|

          format.json { render :json=>{:message=>"Invalid login."}, :callback => params[:callback] }
        end
        return
      end

    # http://rdoc.info/github/plataformatec/devise/master/Devise/Models/TokenAuthenticatable
    @user.ensure_authentication_token!

      if not @user.valid_password?(password)
        logger.info("User #{login} failed signin, password \"#{password}\" is invalid")
        respond_to do |format|

          format.json { render :json=>{:message=>"Invalid password."}, :callback => params[:callback] }
        end
      else
        respond_to do |format|
          format.json { render :json =>{:token=>@user.authentication_token}, :callback => params[:callback] }
        end
      end
  end

  def destroy
    @user=User.find_by_authentication_token(params[:id])
    if @user.nil?
      logger.info('Token not found.')
      respond_to do |format|
        format.json { render :json=>{:message=>'Invalid token.'}, :callback => params[:callback] }
      end
    else
      @user.reset_authentication_token!
      respond_to do |format|
        format.json { render :json=>{:token=>params[:id]}, :callback => params[:callback] }
      end
    end
  end
  
  def skip_trackable
      request.env['devise.skip_trackable'] = true
  end


end
