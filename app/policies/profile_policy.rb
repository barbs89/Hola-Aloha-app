class ProfilePolicy < ApplicationPolicy
    
    def initialize(user, profile)
        @user = user
        @profile = profile
    end

    def index?
        true
    end
    
    def show?
        true
    end

    def create? 
        true
    end

    def new?
        true
    end

    def update?
        true
    end

    def edit?
        true
    end

    def destroy?
        true
    end

end