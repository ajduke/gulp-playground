gulp = require('gulp')
plugins = require('gulp-load-plugins')()
sass= plugins.sass
coffee= plugins.coffee
concat=  plugins.concat
#sass= require('gulp-sass')
#coffee=  require('gulp-coffee')
#concat=  require('gulp-concat')
runSequence = require('run-sequence')


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


gulp.task('build', ()->
  runSequence('copy-files'
  , ['copy-files','compile-sass', 'compile-coffee'])
)

gulp.task('auto', ()->
  gulp.watch(['src/*.coffee','*.scss'], ['compile-sass', 'compile-coffee'])
)


gulp.task('lint', ()->
  gulp.src('prod/**/*.js')
  .pipe(plugins.jshint())
  .pipe(plugins.jshint.reporter("default"))
)


gulp.task('todo', () ->
  gulp.src('www/js/*.js')
  .pipe(plugins.todo())
  .pipe(plugins.todo.reporter('json', {fileName: 'todo.json'}))
  .pipe(gulp.dest('./'))
)


gulp.task('fixjs', ()->
  gulp.src("./www/js/*.js")
    .pipe(plugins.fixmyjs())
    .pipe(gulp.dest("./www/js/"))
)


gulp.task('quality', ['lint', 'fixjs', 'todo']);

gulp.task('default',  ['compile-sass', 'compile-coffee'])
