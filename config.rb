config[:source]       = "source"
config[:layouts_dir]  = "layouts"
config[:css_dir]      = "stylesheets"
config[:fonts_dir]    = "fonts"
config[:js_dir]       = "js"
config[:images_dir]   = "images"
config[:build_dir]    = "docs"

configure :server do
  config[:port]       = 1995
  activate :livereload do |config|
    config.no_swf = true
    config.livereload_css_pattern = /_.*\.(?:s[ca]ss|css)$/
    config.livereload_css_target = "#{config[:css_dir]}/gonehome.css"
  end
end

configure :build do
  config[:http_prefix] = "/gone-home-walkthrough"
end

config[:relative_links] = false

# Slim

# Slim::Embedded.options[:markdown]   = markdown_options
Slim::Engine.options[:format]       = :html
Slim::Engine.options[:sort_attrs]   = false
Slim::Engine.options[:pretty]       = false

# SASS

require "sassc"

config[:sass][:cache] = false
config[:sass][:line_numbers] = false
config[:sass][:style] = :compact

configure :development do
  config[:sass][:style] = :expanded
  config[:sass][:line_numbers] = true
end

# Autoprefixer

configure :production do
  activate :autoprefixer do |config|
    config.browsers = ["> 1%"]
    config.ignore   = ["#{config[:css_dir]}/ie.css"]
  end
end
