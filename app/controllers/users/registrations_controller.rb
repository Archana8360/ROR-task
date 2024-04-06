# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    build_resource(sign_up_params.except(:name, :mobile, :address, :state, :pincode, :city, :country))

    resource.save
    yield resource if block_given?

    if resource.persisted?
      if resource.user_type == 'seller'
        create_seller(sign_up_params, resource)

      elsif resource.user_type == 'customer'
        create_customer(sign_up_params,resource)
      end
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
  
  def create_seller(sign_up_params,resource)
    debugger
    Seller.create!(
      name: sign_up_params[:name],  # Access name from the nested user parameter
      mobile: sign_up_params[:mobile],
      address: sign_up_params[:address],
      state: sign_up_params[:state],
      pincode: sign_up_params[:pincode],
      city: sign_up_params[:city],
      country: sign_up_params[:country],
      user_id: resource.id
    )
      
  end

  def create_customer(sign_up_params,resource)
    Customer.create!(
      name: sign_up_params[:name],  # Access name from the nested user parameter
      mobile: sign_up_params[:mobile],
      address: sign_up_params[:address],
      state: sign_up_params[:state],
      pincode: sign_up_params[:pincode],
      city: sign_up_params[:city],
      country: sign_up_params[:country],
      user_id: resource.id
    )
      
  end

  def sign_up_params
    params.require(:user).permit(:email, :password, :name, :mobile, :address, :state, :pincode, :city, :country, :user_type)
  end
end
