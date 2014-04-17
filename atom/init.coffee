# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#
# An example hack to make opened Markdown files always be soft wrapped:
#
# path = require 'path'
#
# atom.workspaceView.eachEditorView (editorView) ->
#   editor = editorView.getEditor()
#   if path.extname(editor.getPath()) is '.md'
#     editor.setSoftWrap(true)

# TODO: Remove me when rgbkrk/atom-script#98 is merged
# path_prefix = atom.config.get('core.PATH_PREFIX')
# if path_prefix
  # process.env.PATH = [path_prefix, process.env.PATH].join(path.delimiter)
path = atom.config.get('core.PATH')
if path
  process.env.PATH = path
