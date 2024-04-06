# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def respond_with(resource, options={})
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?

    if resource.persisted?
        sign_up(resource_name, resource)
        render json: {
          status: {code: 200, message: 'Signed up successfully', data: resource}
        }, status: :ok
    else
      render json: {
        status: {message: "User couldn't be created successfully. #{resource.errors.full_messages.to_sentence}", errors: resource.errors.full_messages }
      }
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :password)
  end
end
