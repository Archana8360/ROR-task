class OrderPolicy < ApplicationPolicy
    def index?
      user.admin? || user.seller?  # Only admins and sellers can see all orders
    end
  
    def show?
      user.admin? || record.customer_id == user.id  # Customers can only see their own orders
    end


    def create?
      user.admin? ||  record.customer_id == user.id 
    end

    def update?
      user.admin? ||  record.customer_id == user.id 
    end

    def destroy?
      user.admin? 
    end

end
