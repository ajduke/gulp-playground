// This demostrates linting files with jshint on save of file.

gulp = require('gulp');
jshint= require('gulp-jshint');

gulp.task('default', ['watch']);

gulp.task('jshint', function() {
  return gulp.src('src/*.js')
    .pipe(jshint())
    .pipe(jshint.reporter('jshint-stylish'));
});

// configure which files to watch and what tasks to use on file changes
gulp.task('watch', function() {
  gulp.watch('src/*.js', ['jshint']);
});