class ApplicationController < ActionController::API
    include Pundit

    def pundit_user
        current_user
    end
end
