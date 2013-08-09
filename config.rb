
# ROUTER IMPLEMENTATION VIA MIDDLEMAN RACKWARE
page "/",               :layout => :layout
page "/*",              :layout => :general
page "/projects.html",  :layout => :project

#SET DIRECTORIES OF IMG / JS / CSS
set :css_dir, 'css'

set :js_dir, 'js'

set :images_dir, 'img'

activate :livereload

#WHEN BUILDING SITE, DODO? 
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  activate :cache_buster

  # Use relative URLs
  activate :relative_assets

  activate :directory_indexes

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"
end

#WHEN LAND PROJECT/* DODO? && BLOG PREFERENCES
activate :blog do |blog|

  blog.prefix = "projects"
  blog.permalink = ":title"
  blog.layout = "project-stand-alone"
  blog.default_extension = ".md"

end

# TURNS ON RELATIVE ASSETS. DO NOT CHANGE
activate :relative_assets

# TURNS ON VANITY URLS. DO NOT CHANGE. 
activate :directory_indexes

# TURNS ON RELATIVE LINKING. DO NOT CHANGE.
set :relative_links, true

# IN BROWSER EDITING PREFERENCES. DO NOT CHANGE. 
# DOES NOT WORK AT THE MOMENT.
# WAIT UNTIL COMPASS ACCEPTS SASS BLEEDING EDGE
sass_options = {:debug_info => true}
sass_options = {:sourcemap => true}
