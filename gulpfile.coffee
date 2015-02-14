gulp = require('gulp')
sass= require('gulp-sass')
coffee=  require('gulp-coffee')
concat=  require('gulp-concat')

gulp.task('copy-files', ()->
  gulp.src('src/**/*.*')
    .pipe(gulp.dest('prod'))
)


gulp.task('compile-sass', ()->
  gulp.src('src/**/*.scss')
    .pipe(sass())
    .pipe(gulp.dest('prod/css'))
)


gulp.task('compile-coffee', ()->
  gulp.src('src/**/*.coffee')
    .pipe(coffee({bare: false}))
    .pipe(gulp.dest('prod/js'))

)

gulp.task('scripts', ()->
  gulp.src('src/**/*.coffee')
    .pipe(coffee({bare: false}))
    .pipe(concat('scripts.js'))
    .pipe(gulp.dest('prod'))
)

gulp.task('auto', ()->
  gulp.watch(['src/*.coffee','*.scss'], ['compile-sass', 'compile-coffee'])
)

gulp.task('default',  ['compile-sass', 'compile-coffee'])
