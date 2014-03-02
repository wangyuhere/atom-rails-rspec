Path = require 'path'

module.exports =
class Rails
  constructor: (@root) ->

  toggleSpecFile: (file) ->
    return null unless file.match /\.rb$/i

    relativePath = file.substring(@root.length)
    if relativePath.match /_spec\.rb$/
      relativePath = relativePath.replace /_spec\.rb$/, '.rb'
      relativePath = relativePath.replace /^\/spec\/lib\//, '/lib/'
      relativePath = relativePath.replace /^\/spec\//, '/app/'
    else
      relativePath = relativePath.replace /\.rb$/, '_spec.rb'
      relativePath = relativePath.replace /^\/app\//, '/spec/'
      relativePath = relativePath.replace /^\/lib\//, '/spec/lib/'
    Path.join @root, relativePath
