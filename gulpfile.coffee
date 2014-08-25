gulp = require('gulp')
coffee = require('gulp-coffee')

gulp.task 'js', ->
  gulp.src('bin/*.coffee')
      .pipe(coffee())
      .pipe gulp.dest('bin/')
  gulp.src('test/*.coffee')
      .pipe(coffee())
      .pipe gulp.dest('test/')

gulp.task 'watch', ->
  gulp.watch [
    'bin/*.coffee'
    'test/*.coffee'
  ], -> gulp.start 'js'

gulp.task 'default', ->
  gulp.start 'js'