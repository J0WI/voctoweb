module PublicJsonHelper
  def frontend_event_url(slug: '')
    return event_url(slug: slug) unless Rails.env.production?
    event_url(slug: slug, host: Settings.frontend_host, protocol: Settings.frontend_proto, port: nil)
  end

  def json_cached_key(identifier, *models)
    'js_' + identifier.to_s + Digest::SHA1.hexdigest(models.flatten.map { |m| m.updated_at.to_i }.join(';'))
  end
end
