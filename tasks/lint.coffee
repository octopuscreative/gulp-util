###
| ----------------------------------------------------------------
| Linters
| ----------------------------------------------------------------
|
| Handles linting your code to ensure quality & adherence
| to the Octopus Style Guide
| <https://github.com/octopuscreative/octopus-style>
|
###

module.exports = (gulp, run, bs, reload, paths) ->

  () ->

    gulp.task 'lint-scss', () ->
      .src paths.sass
      .pipe gulpStylelint
        reporters:
          formatter: 'string'
          console: true

    gulp.task 'lint-coffee', () ->
      gulp.src paths.coffee
      .pipe coffeelint()
      .pipe coffeelint.reporter()
