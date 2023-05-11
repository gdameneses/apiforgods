class ReposController < ApplicationController
    def index
        @repos = Repo.order(:languages)
    end

    def show
        @repo = Repo.find(params[:id])
    end
end
