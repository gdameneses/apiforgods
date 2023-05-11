class ReposController < ApplicationController
    def index
        @repos = Repo.order(:languages)
    end
end
