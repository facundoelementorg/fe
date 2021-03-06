
require "middleman-smusher"

# ROUTER IMPLEMENTATION VIA MIDDLEMAN RACKWARE
page "/",               :layout => :layout
page "/projects.html",  :layout => :project
page "/articles.html",  :layout => :articles

#SET DIRECTORIES OF IMG / JS / CSS
set :css_dir, 'css'
set :js_dir, 'js'
#set :images_dir, 'img'

#SET MARKDOWN ENGINE CHOICE
set :markdown_engine, :redcarpet

#ACTIVATE LIVERELOAD SERVER
activate :livereload

activate :directory_indexes
activate :gzip
activate :minify_html



#WHEN LAND PROJECT/* DODO? && BLOG PREFERENCES
activate :blog do |blog|
  blog.name = "projects"
  blog.prefix = "projects"
  blog.permalink = ":title"
  blog.layout = "projectsingle"
  blog.default_extension = ".md"
  blog.paginate = true

end

#WHEN LAND PROJECT/* DODO? && BLOG PREFERENCES
activate :blog do |blog|
  blog.name = "articles"
  blog.prefix = "articles"
  blog.permalink = ":title"
  blog.layout = "articlesingle"
  blog.default_extension = ".md"
  blog.paginate = true

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

#WHEN BUILDING SITE, DODO? 
configure :build do
  
  ignore 'images/assets/*'

  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  #activate :cache_buster

  # TURNS ON RELATIVE ASSETS. DO NOT CHANGE
  activate :relative_assets

  # TURNS ON VANITY URLS. DO NOT CHANGE. 
  activate :directory_indexes

  # TURNS ON RELATIVE LINKING. DO NOT CHANGE.
  set :relative_links, true

  activate :directory_indexes
  activate :gzip
  activate :minify_html
  #activate :cache_buster
  #activate :asset_hash

end