module ApplicationHelper
  def flash_alert_color_bg(type)
    colors = { 'notice' => 'alert-success',
               'alert' => 'alert-danger'
    }

    return 'alert-secondary' if colors[type].nil?

    colors[type]
  end

  def user_avatar(user)
    # TODO: upload user avatars
    asset_pack_path('media/images/user.png')
  end
end
