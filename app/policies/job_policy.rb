class JobPolicy < ApplicationPolicy

    def initialize(user, job)
        @user = user
        @job = job
    end
    def index?
        true
    end
    
    def create?
        user.present?
    end
    
    def edit?
        return true if user.present? && user == job.user
    end

    def destroy?
        return true if user.present? && user == job.user
    end

    private
 
    
end