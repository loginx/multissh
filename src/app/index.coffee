app = require 'app'
path = require 'path'
BrowserWindow = require 'browser-window'
Menu = require 'menu'
menuTemplate = require './components/menuTemplate'

conf =
  paths:
    ui:
      path.resolve __dirname, '..', 'ui'

require('crash-reporter').start()

do (mainWindow = null) ->
  app.on 'window-all-closed', ->
    app.quit() unless process.platform is 'darwin'

  app.on 'ready', ->
    mainWindow = new BrowserWindow width: 800, height: 600
    mainWindow.loadUrl "file://#{conf.paths.ui}/index.html"
    mainWindow.on 'closed', -> mainWindow = null
    menu = Menu.buildFromTemplate menuTemplate(app)
    Menu.setApplicationMenu menu
