class LanguagesController < ApplicationController
  def index
    @languages = Language.all
    @language = Language.new
  end

  def create 
    @languages = Language.all
    @language = Language.new(language_params)
    url = "https://api.github.com/search/repositories?q=language:#{@language.name.downcase}&sort=stars&per_page=5"
    request = HTTParty.get(url)
    request_hash = request.to_h
    items = request_hash['items']
    create_repos(items, @language)
    if @language.save
      redirect_to :root
    else
      render :index
    end
  end 
  def show
  end

  def destroy
  end

  private

  def language_params
    params.require(:language).permit(:name)
  end 

  def create_repos(items, language)
    items.each do |item|
      repo_languages = HTTParty.get('https://api.github.com/repos/rails/rails/languages').to_h.keys
      repo = Repo.new(
        full_name: item['name'],
        owner: item['owner']['login'],
        description: item['description'],
        api_url: item['api_url'],
        html_url: item['html_url'],
        ssh_url: item['ssh_url'],
        languages: repo_languages,
        stars: item['stargazers_count'],
        created: item['created_at'].to_s,
        updated: item['updated_at'].to_s,
      )
      repo.language = language

      repo.save
    end
  end 
end
