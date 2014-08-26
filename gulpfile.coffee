gulp = require('gulp')
coffee = require('gulp-coffee')
mocha = require('gulp-mocha')

gulp.task('js', ->
  gulp.src('bin/*.coffee')
      .pipe(coffee())
      .pipe gulp.dest('bin/')
  gulp.src('test/*.coffee')
      .pipe(coffee())
      .pipe gulp.dest('test/')
)

gulp.task('watch', ->
  gulp.watch([
    'bin/*.js'
    'bin/*.coffee'
    'test/*.coffee'
  ], -> 
    gulp.start 'js'
    gulp.start 'test'
  )
)

gulp.task('default', ->
  gulp.start 'js'
)

gulp.task('test', ->
  gulp.src([
    'test/*.test.coffee'
    'bin/ScrambledImage.js'
  ])
    .pipe(mocha {reporter: 'spec'})
)