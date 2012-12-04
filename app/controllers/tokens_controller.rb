class TokensController  < ApplicationController
    skip_before_filter :verify_authenticity_token
    before_filter :skip_trackable, :cors_preflight_check
    after_filter :cors_set_access_control_headers
    
    respond_to :json 
    def create
      email = params[:email]
      password = params[:password]

      if email.nil? or password.nil?
         respond_to do |format|

          format.json { render :json=>{:message=>"Please enter your user name and password."}, :callback => params[:callback] }
         end
      end

    @user=User.find_by_email(email.downcase)

      if @user.nil?
        logger.info("User #{email} failed signin, user cannot be found.")
        respond_to do |format|

          format.json { render :json=>{:message=>"Invalid email."}, :callback => params[:callback] }
        end
        return
      end

    # http://rdoc.info/github/plataformatec/devise/master/Devise/Models/TokenAuthenticatable
    @user.ensure_authentication_token!

      if not @user.valid_password?(password)
        logger.info("User #{email} failed signin, password \"#{password}\" is invalid")
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
