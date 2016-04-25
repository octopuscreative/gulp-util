###
| ----------------------------------------------------------------
| Browserify
| ----------------------------------------------------------------
|
| Handles compiling our CoffeeScript files into plain JavaScript.
| Everything gets minified and outputted as a `scripts.min.js`
| file within the main `assets` folder. Also triggers live
| reloading via BrowserSync afterwards.
|
###

module.exports = (gulp, run, bs, reload, paths) ->

  () ->

    gulp.task "coffee", ->
      gulp.src(paths.coffee, read: false)
      .pipe(browserify(
        transform: ["coffeeify"]
        extensions: [".coffee"])
      )
      .pipe run.uglify()
      .pipe run.filesize()
      .pipe(rename("app.js"))
      .pipe gulp.dest "assets/js"
      .pipe run.notify message : 'Coffeescript compiled and minified!'
      .pipe reload stream : true
