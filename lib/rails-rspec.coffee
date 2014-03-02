Rails = require './rails'

module.exports =
  activate: (state) ->
    atom.workspaceView.command 'rails-rspec:toggle-spec-file', '.editor', =>
      @toggleSpecFile()

  toggleSpecFile: ->
    editor = atom.workspace.getActiveEditor()
    file = new Rails(atom.project.getPath()).toggleSpecFile(editor.getPath())
    atom.workspaceView.open(file) if file?
