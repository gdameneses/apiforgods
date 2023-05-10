class CreateRepos < ActiveRecord::Migration[7.0]
  def change
    create_table :repos do |t|
      t.string :full_name
      t.string :owner
      t.string :owner_avatar
      t.string :description
      t.string :api_url
      t.string :html_url
      t.string :ssh_url
      t.string :languages
      t.string :stars
      t.string :created
      t.string :updated

      t.timestamps
    end
  end
end
