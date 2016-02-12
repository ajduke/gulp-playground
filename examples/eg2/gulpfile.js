
var gulp       = require('gulp'),
  jshint     = require('gulp-jshint'),
  sass       = require('gulp-sass'),
  sourcemaps = require('gulp-sourcemaps');

gulp.task('build-css', function() {
  return gulp.src('src/**/*.scss')
    .pipe(sourcemaps.init())  // Process the original sources
    .pipe(sass())
    .pipe(sourcemaps.write()) // Add the map to modified source.
    .pipe(gulp.dest('src/assets/stylesheets'));
});

gulp.task('default', ['build-css'])