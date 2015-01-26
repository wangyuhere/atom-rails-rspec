Rails = require './rails'

module.exports =
  configDefaults:
    specSearchPaths: ['spec', 'fast_spec']
    specDefaultPath: 'spec'

  activate: (state) ->
    atom.commands.add 'atom-text-editor',
      'rails-rspec:toggle-spec-file': (event) => @toggleSpecFile()

  toggleSpecFile: ->
    editor = atom.workspace.getActiveEditor()
    specPaths = atom.config.get 'rails-rspec.specSearchPaths'
    specDefault = atom.config.get 'rails-rspec.specDefaultPath'
    file = new Rails(atom.project.getPath(), specPaths, specDefault).toggleSpecFile(editor.getPath())
    atom.workspaceView.open(file) if file?
