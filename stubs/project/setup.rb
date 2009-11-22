# encoding: utf-8

# This hook will be executed in context of current generator object before templater start to generate new files.
# You can update context hash and register hooks. Don't forget to use merge! instead of merge, because you are
# manipulating with one object, rather than returning new one.

# rango create app blog --models=post,tag --controllers=posts,tags --router=usher|rack-router|rack-mount --template-engine=erubis
hook do |generator, context|
  models  = context[:models] || Array.new
  controllers = context[:controllers] || Array.new
  context.merge!(models: models, controllers: controllers)
  context[:router] = "usher" unless context[:router]
  context[:template_engine] = "haml" unless context[:template_engine]
end
