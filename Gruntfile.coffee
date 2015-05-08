path = require 'path'

module.exports = (grunt) ->
  require('load-grunt-tasks')(grunt)

  grunt.initConfig
    pkg: pkg = grunt.file.readJSON 'package.json'

    clean:
      ui: ['dist/ui']
      app: ['dist/app']

    copy:
      assets:
        files: [
          {expand: true, cwd: 'src', src: ['ui/assets/**/*'], dest: 'dist/'}
        ]

    jade:
      options:
        data:
          pkg: pkg
      default:
        files: [
          {
            expand: true
            cwd: 'src'
            src: ['ui/**/*.jade']
            dest: 'dist/'
            ext: '.html'
          }
        ]

    stylus:
      default:
        files: [
          {
            expand: true
            cwd: 'src'
            src: ['ui/**/*.styl']
            dest: 'dist/'
            ext: '.css'
          }
        ]

    coffee:
      app:
        options:
          sourceMap: false
        expand: true,
        cwd: 'src',
        src: ['app/**/*.coffee'],
        dest: 'dist/',
        ext: '.js'
      ui:
        options:
          sourceMap: true
        expand: true
        cwd: 'src'
        src: ['ui/**/*.coffee']
        dest: 'dist/'
        ext: '.js'

    watch:
      options:
        event: 'all'

      app_coffee:
        options:
          livereload: true
        files: ["src/app/**/*.coffee"]
        tasks: ["coffee:app"]

      ui_coffee:
        options:
          livereload: true
        files: ["src/ui/**/*.coffee"]
        tasks: ["coffee:ui"]

      jade:
        options:
          livereload: true
        files: ["src/ui/**/*.jade"]
        tasks: ["jade"]

      stylus:
        options:
          livereload: true
        files: ["src/ui/**/*.styl"]
        tasks: ["stylus"]

      assets:
        options:
          livereload: true
        files: ["src/ui/assets/**/*"]
        tasks: ["copy:assets"]


    devUpdate:
      default:
        options:
          packages:
            dependencies: true
            devDependencies: true
          semver: false

    bump:
      options:
        updateConfigs: ['pkg']
        pushTo: 'origin'
        commitFiles: ['package.json', 'CHANGELOG.md'],
        commitMessage: 'chore: release v%VERSION%'

  grunt.registerTask 'build:ui', [
    'clean:ui'
    'coffee:ui'
    'jade'
    'stylus'
    'copy:assets'
  ]

  grunt.registerTask 'build:app', [
    'clean:app'
    'coffee:app'
  ]

  grunt.registerTask 'build', ['build:app', 'build:ui']
  grunt.registerTask 'default', ['build']
  grunt.registerTask 'serve', ['build', 'watch']

  grunt.registerTask 'release', 'bump, changelog, commit', (type = "patch") ->
    grunt.task.run [
      "bump-only:#{type}"
      "changelog"
      "bump-commit"
    ]
