#example init.coffee
path = require 'path'

env_path = atom.config.get('core.PATH')
if env_path
  process.env.PATH = env_path

process.env.CONTROLS_API_ENDPOINT = atom.config.get('core.CONTROLS_API_ENDPOINT') if atom.config.get('core.CONTROLS_API_ENDPOINT')
process.env.CONTROLS_WEB_ENDPOINT = atom.config.get('core.CONTROLS_WEB_ENDPOINT') if atom.config.get('core.CONTROLS_WEB_ENDPOINT')
process.env.CONTROLS_HOSTNAME = atom.config.get('core.CONTROLS_HOSTNAME') if atom.config.get('core.CONTROLS_HOSTNAME')
process.env.CONTROLS_USERNAME = atom.config.get('core.CONTROLS_USERNAME') if atom.config.get('core.CONTROLS_USERNAME')
process.env.CONTROLS_PASSWORD = atom.config.get('core.CONTROLS_PASSWORD') if atom.config.get('core.CONTROLS_PASSWORD')
