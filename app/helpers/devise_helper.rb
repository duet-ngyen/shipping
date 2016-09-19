module DeviseHelper
  def devise_error_messages!
    flash_alerts = []
    error_key = 'errors.messages.not_saved'

    unless flash.empty?
      flash_alerts.push(flash[:error]) if flash[:error]
      flash_alerts.push(flash[:alert]) if flash[:alert]
      flash_alerts.push(flash[:notice]) if flash[:notice]
      error_key = 'devise.failure.invalid'
    end

    return '' if !resource || resource.try(:errors).try(:empty?) && flash_alerts.empty?
    errors = resource.errors.empty? ? flash_alerts : resource.errors.full_messages

    messages = errors.map { |msg| content_tag(:li, msg) }.join
    sentence = t(error_key,
                 count: errors.count,
                 resource: resource.class)

    html = <<-HTML
    <div class="aui-message aui-message-error closeable">
      <p class="title">
        <span class="aui-icon icon-error"></span>
        <strong>#{sentence}</strong>
      </p>
      <p>#{messages}</p>
      <span class="aui-icon icon-close" role="button" tabindex="0"></span>
    </div>
    HTML

    html.html_safe
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
  def alert_from_devise(alert)
    if alert.instance_of? Array
      results = ''
      alert.each do |message|
        results += (_alert_from_device message + '<br/>')
      end
      return results
    else
      _alert_from_device alert
    end
  end

  private

  def _alert_from_device(alert)
    if alert =~ /\Acustom_message_for\(:([a-z_]+)\)\Z/
      t("devise.custom_message.#{Regexp.last_match(1)}")
    else
      alert
    end
  end
end
