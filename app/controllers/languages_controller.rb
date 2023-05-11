class LanguagesController < ApplicationController
  def index
    @languages = Language.all
    @language = Language.new
  end

  def create
    @languages = Language.all
    @language = Language.new(language_params)
    access_token = ENV['GH_ACCESS_TOKEN']
    url = "https://api.github.com/search/repositories?q=language:#{@language.name}&sort=stars&per_page=5"
    request = HTTParty.get(
      url,
      headers: { Authorization: "Bearer #{access_token}" }
    )
    request_hash = request.to_h
    items = request_hash['items']
    create_repos(items, @language)
    if @language.save
      redirect_to :root
    end
  end

  def destroy
    @language = Language.find(params[:id])
    @language.destroy
    redirect_to :root
  end

  private

  def language_params
    params.require(:language).permit(:name)
  end

  def create_repos(items, language)
    items.each do |item|
      repo_owner = item['owner']['login']
      repo_name = item['name']
      repo_languages = HTTParty.get("https://api.github.com/repos/#{repo_owner}/#{repo_name}/languages").to_h.keys
      repo = Repo.new(
        full_name: repo_name,
        owner: repo_owner,
        description: item['description'],
        api_url: item['api_url'],
        html_url: item['html_url'],
        ssh_url: item['ssh_url'],
        languages: repo_languages,
        stars: item['stargazers_count'],
        created: item['created_at'],
        updated: item['updated_at']
      )
      repo.language = language

      repo.save
    end
  end
end
