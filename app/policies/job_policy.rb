class JobPolicy < ApplicationPolicy

    def initialize(user, job)
        @user = user
        @job = job
    end
    

    def update?
        user == job.user
    end

    def edit?
        update? 
    end

end