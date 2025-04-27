class PagesController < ApplicationController
    before_action :require_login, only: [ :profile, :editprofile, :resetpassword]
    before_action :set_user, only: [:profile, :editprofile, :resetpassword]

    def login
    end

    def signup
        @user = User.new
    end

    def create
        @user = User.find_by(username: params[:username])

        if !!@user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to listings_path
        else
            flash[:alert] = "Incorrect username or password!"
            redirect_to login_path
        end
    end

    def editprofile
        if @user != current_user
            redirect_to profile_path
        end
    end

    def resetpassword
        if @user != current_user
            redirect_to profile_path
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:notice] = "You have been logged out."
        redirect_to login_path
    end

    def market
        @listings = Listing.all
    end
    
    private

    def set_user
        @user = User.find_by(id: session[:user_id])
    end
end
# <%# <body class="main-bg">
#   <div class="login-container text-c animated flipInX">
#       <h3 class="text-whitesmoke-header">Stampede</h3>
#       <div class="container-content">
#       <%= form_with url: '/login', method: :post, local: true, class: "margin-t" do |f| %>
#           <div class="form-group">
#           <%= f.text_field :username, class: "form-control", placeholder: "Username", required: true %>
#           </div>
#           <div class="form-group">
#           <%= f.password_field :password, class: "form-control", placeholder: "Password", required: true %>
#           </div>
#           <%= f.submit "Sign In", class: "form-button button-l margin-t-xs margin-b" %>

#           <a class="text-darkyellow" href="/forgot-password"><small>Forgot your password?</small></a>
#           <p class="text-whitesmoke text-center"><small>Do not have an account?</small></p>
#           <a class="text-darkyellow" href="/signup"><small>Sign Up</small></a>
#       <% end %>
#       <p class="margin-t text-whitesmoke"><small> Stampede &copy; 2025</small></p>
#     </div>
#   </div>
# </body>
# %>
