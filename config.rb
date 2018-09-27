config[:source]       = "source"
config[:layouts_dir]  = "layouts"
config[:css_dir]      = "stylesheets"
config[:fonts_dir]    = "fonts"
config[:js_dir]       = "js"
config[:images_dir]   = "images"

configure :server do
  config[:port]       = 1995
  activate :livereload do |config|
    config.no_swf = true
    config.livereload_css_pattern = /_.*\.(?:s[ca]ss|css)$/
    config.livereload_css_target = "#{config[:css_dir]}/gonehome.css"
  end
end

configure :build do
  config[:http_prefix] = "/~zgm/gone-home-walkthrough"
end

config[:relative_links] = true

# # Redcarpet Markdown

# config[:markdown_engine] = :redcarpet

# markdown_options = {
#   # make “smart” quotes
#   smartypants: true,
#   # do not parse emphasis inside of words (foo_bar_baz)
#   no_intra_emphasis: true,
#   # parse tables, PHP-Markdown style
#   tables: false,
#   # parse ``` or ~~~ fenced code blocks, PHP-Markdown style
#   fenced_code_blocks: true,
#   # parse links even when they are not enclosed in <> characters
#   autolink: true,
#   # do not parse usual Markdown code blocks
#   disable_indented_code_blocks: true,
#   # parse ~~strikethrough~~, PHP-Markdown style
#   strikethrough: true,
#   # HTML blocks are not required to be surrounded by an empty line
#   lax_spacing: true,
#   # require space after a header's hash, e.g. #this is an invalid header
#   space_after_headers: true,
#   # parse superscripts after ^; e.g. this is the 2^(nd) time
#   superscript: false,
#   # parse underscored emphasis as _underlined_, but this is still *italic*
#   underline: false,
#   # parse ==highlighted== as <mark>highlighted</mark>
#   highlight: true,
#   # parse "quotes" to <q>quotes</q>
#   quote: false,
#   # parse footnotes, PHP-Markdown style[^1]
#   footnotes: true
# }

# config[:markdown] = markdown_options

# Slim

# Slim::Embedded.options[:markdown]   = markdown_options
Slim::Engine.options[:format]       = :html
Slim::Engine.options[:sort_attrs]   = false
Slim::Engine.options[:pretty]       = false

# SASS

require "sass"

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
    config.browsers = ["last 2 versions", "Explorer >= 9", "> 5%"]
    config.ignore   = ["#{config[:css_dir]}/ie.css"]
  end
end
