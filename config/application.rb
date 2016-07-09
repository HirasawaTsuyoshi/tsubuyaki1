require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module NewMyBlog
  class Application < Rails::Application

    # 初期設定　日本時間と日本語をブログに適用
    config.time_zone = 'Tokyo'
    config.i18n.default_locale = :ja

    config.active_record.raise_in_transactional_callbacks = true

    config.assets.initialize_on_precompile = false
  end
end
