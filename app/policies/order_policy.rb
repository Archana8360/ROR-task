class OrderPolicy < ApplicationPolicy
    def index?
      
      user.admin? ||  record.customer_id == user.id || record.seller_id == user.id
    end
  
    def show?
      user.admin? ||  record.customer_id == user.id || record.seller_id == user.id
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

    def search?
      user.admin? ||  record.customer_id == user.id || record.seller_id == user.id
    end
end
