# frozen_string_literal: true

activate :livereload

activate :syntax
set :markdown_engine, :kramdown
set :markdown, fenced_code_blocks: true, smartypants: true

activate :autoprefixer do |prefix|
  prefix.browsers = 'last 2 versions'
end

activate :blog do |blog|
  blog.layout = 'post'
  blog.sources = 'posts/{title}.html'
  blog.permalink = '{title}.html'
end

activate :imageoptim do |options|
  # Use a build manifest to prevent re-compressing images between builds
  # options.manifest = true

  # Silence problematic image_optim workers
  options.skip_missing_workers = true

  # Cause image_optim to be in shouty-mode
  options.verbose = true

  # Setting these to true or nil will let options determine them (recommended)
  options.nice = true
  options.threads = true

  options.image_extensions = %w[.jpg]

  options.allow_lossy = true
  options.jpegoptim = { strip: ['all'], max_quality: 60 }
  options.jpegtran  = { copy_chunks: false, progressive: true, jpegrescan: true }
end

configure :build do
  activate :minify_css, inline: true
  # activate :minify_html
  activate :asset_hash
  activate :gzip

  # ignore (public) assets directory
  set :css_dir, 'stylesheets'
  set :js_dir, 'javascripts'
  ignore 'stylesheets/*'
  ignore 'javascripts/*'
end
