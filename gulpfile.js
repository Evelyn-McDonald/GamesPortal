// *************************************
//
//   Gulpfile
//
// *************************************
//
// Available tasks:
//   `gulp`
//   `gulp build`
//   `gulp compile:coffee`
//   `gulp compile:sass`
//   `gulp minify:css`
//   `gulp minify:js`
//   `gulp templates`
//
// *************************************

var gulp 	= require('gulp');
var plugins = require('gulp-load-plugins')();

var options = {
  build : {
    //tasks       : [ 'compile:sass', 'compile:coffee', 'templates', 'minify:css', 'minify:js', 'watch' ],
    tasks       : [ 'compile:sass', 'compile:coffee', 'templates', 'minify:css', 'watch' ],
    paths : {
      sass        : './sass/**/*.scss',
      css         : './public/assets/css/',
      coffee      : './app/**/*.coffee',
      js          : './public/js/',
      templates   : './templates/'
    }
  }
};


// -------------------------------------
//   Task: Default
// -------------------------------------

gulp.task( 'default', function() {

  options.build.tasks.forEach( function( task ) {
    gulp.start( task );
  });

});


// -------------------------------------
//   Task: Build
// -------------------------------------

gulp.task( 'build', function() {

  options.build.tasks.forEach( function( task ) {
    gulp.start( task );
  });

});


// -------------------------------------
//   Task: Compile: Sass
// -------------------------------------

gulp.task('compile:sass', function () {

  gulp.src(options.build.paths.sass)
    .pipe((plugins.sass()).on('error', plugins.sass.logError))
    .pipe(gulp.dest(options.build.paths.css));

});


// -------------------------------------
//   Task: Compile: Coffee
// -------------------------------------

gulp.task('compile:coffee', function () {

  gulp.src(options.build.paths.coffee)
    .pipe(plugins.coffee({bare: true}).on('error', plugins.util.log))
    .pipe(gulp.dest(options.build.paths.js));

});


// -------------------------------------
//   Task: Minify: css
// -------------------------------------

gulp.task('minify:css', function () {

  gulp.src(options.build.paths.css + '*.css')
    .pipe(plugins.minifyCss({compatibility: 'ie8'}))
    .pipe(gulp.dest(options.build.paths.css));

});


// -------------------------------------
//   Task: Minify: js
// -------------------------------------

gulp.task('minify:js', function () {

  gulp.src(options.build.paths.js + '*.js')
    .pipe(plugins.uglify())
    .pipe(gulp.dest(options.build.paths.js));

});


// -------------------------------------
//   Task: Templates
// -------------------------------------

gulp.task('templates', function () {

  gulp.src(options.build.paths.templates + '*.hbs')
    .pipe(plugins.handlebars())
    .pipe(plugins.wrap('Handlebars.template(<%= contents %>)'))
    .pipe(plugins.declare({
      namespace: 'GamesPortal.templates',
      noRedeclare: true, // Avoid duplicate declarations 
    }))
    .pipe(plugins.concat('templates.js'))
    .pipe(gulp.dest(options.build.paths.js));

});


// -------------------------------------
//   Task: Watch
// -------------------------------------

gulp.task('watch', function () {

  gulp.watch(options.build.paths.sass, ['compile:sass']);
  gulp.watch(options.build.paths.css + '*.css', ['minify:css']);

  gulp.watch(options.build.paths.coffee, ['compile:coffee']);
  gulp.watch(options.build.paths.js + '*.js', ['minify:js']);

  gulp.watch(options.build.paths.templates + '*.hbs', ['templates']);  

});

