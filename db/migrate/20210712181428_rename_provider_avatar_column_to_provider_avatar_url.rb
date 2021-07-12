class RenameProviderAvatarColumnToProviderAvatarUrl < ActiveRecord::Migration[6.1]
  def change
    rename_column(:users, :provider_avatar, :provider_avatar_url)
  end
end
