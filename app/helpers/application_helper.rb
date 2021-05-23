module ApplicationHelper
  def flash_alert_color_bg(type)
    colors = { 'notice' => 'alert-success',
               'alert' => 'alert-danger'
    }

    return 'alert-secondary' if colors[type].nil?

    colors[type]
  end

  def user_avatar(user)
    asset_pack_path('media/images/user.png')
  end

  def fa_icon(icon_class)
    content_tag 'span', '', class: "fa fa-#{icon_class}"
  end
end
