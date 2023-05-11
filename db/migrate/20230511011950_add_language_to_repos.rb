class AddLanguageToRepos < ActiveRecord::Migration[7.0]
  def change
    add_reference :repos, :language, foreign_key: true
  end
end
