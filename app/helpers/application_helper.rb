module ApplicationHelper
  def flash_alert_color_bg(type)
    colors = { 'notice' => 'alert-success',
               'alert' => 'alert-danger' }

    return 'alert-secondary' if colors[type].nil?

    colors[type]
  end

  def user_avatar_thumb(user)
    if user.avatar.file.present?
      user.avatar.thumb.url
    else
      asset_pack_path('media/images/user.png')
    end
  end

  def event_photo(event)
    photos = event.photos.persisted

    if photos.any?
      photos.sample.photo.url
    else
      asset_pack_path('media/images/event.jpg')
    end
  end

  def event_thumb
    photos = event.photos.persisted

    if photos.any?
      photos.sample.photo.thumb.url
    else
      asset_pack_path('media/images/event_thumb.jpg')
    end
  end

  def user_avatar(user)
    return user.avatar.url if user.avatar?

    # Check if User has removed OAuth app integration on provider service
    if user.provider_avatar_url?
      provider_avatar_uri = URI(user.provider_avatar_url)
      res = Net::HTTP.get_response(provider_avatar_uri)
      return user.provider_avatar_url if [Net::HTTPFound, Net::HTTPOK].include?(res.class)
    end

    asset_pack_path('media/images/user.png')
  end

  def fa_icon(icon_class)
    content_tag 'span', '', class: "fa fa-#{icon_class}"
  end
end
