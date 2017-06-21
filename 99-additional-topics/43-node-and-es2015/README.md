# ES2015, Node.js, and Build Tools
Today we'll take a look at Node, tools for building web apps with Node, and
a whirlwind tour of new syntax and features in ES2015.

## Agenda
  1. Review Node.js
  2. Intro to ES2015
  3. Build systems and their uses


### Setup
Make sure you have [Node.js installed](https://nodejs.org/en/download/package-manager/). This should also install `npm`.

## Review Node.js

### Node
Node.js is a JavaScript runtime built on the [V8 JS engine](https://developers.google.com/v8/). It is intended for use on a server, rather than a browser.

Node.js provides a number of features that are needed for server-side JS, but unnecessary in the browser, like file IO.

Node.js is event-driven, and uses a non-blocking IO model.

### NPM
NPM is the **N**ode **P**ackage **M**anager. It is used to manage Node.js libraries and CLIs, similar to Ruby's RubyGems.

## Intro to ES2015

### What is ES2015?
[ES2015](https://babeljs.io/learn-es2015/), previously known as ES6, is the latest standard of the JS language. It adds a number of new features to JS.

Unfortunately, ES2015 is not currently fully implemented in any common browser. It is usable in Node.js, but getting it to work in the browser will require some extra steps.

### Babel
[Babel](https://babeljs.io/) is a JS compiler. It translates JS into different versions of JS, like ES2015 into ES5 for example.

### `strict` Mode
[Strict Mode](https://developer.mozilla.org/en/docs/Web/JavaScript/Reference/Strict_mode) is an option added in ES5 that restricts JS. It disallows certain unsafe code. In ES5 its opt in, but in ES2015, its enabled by default.

### `let` and `const`
In ES5 and earlier versions of JS, we declare variables with the `var` keyword.

In ES2015, we're given two new ways to declare variables, `let` and `const`.

`let` is for declaring mutable variables, and `const` is for immutable variables.

Note that scoping works a little differently for `let` and `const` vs `var`.

### Template Strings
ES2015 introduces a new syntax for string interpolation:
```js
let x = "World";
console.log(`Hello, ${x}!`); // Prints out "Hello, World!"
```

Template strings use backticks instead of quotation marks, and perserve whitespace.

### Classes
ES2015 gives us syntactic sugar that mimics a more traditional class-based OO pattern. Under the hood, this is still prototypal inheritance, but as far as the programmer is concerned, classes exist in ES2015.

Here's [an example](https://babeljs.io/learn-es2015/#ecmascript-2015-features-classes)

### => Functions
We can use an alternative syntax to define functions in ES2015.

```js
// A traditional function declaration
function foo(x) {
  console.log(x);
  console.log('foo');
}

// The alternative syntax
let bar = (y) => {
  console.log(y);
  console.log('bar');
}
```

Note that the meaning of `this` is different than traditional functions in this new syntax.

## Build Tools

### Grunt
[Grunt](http://gruntjs.com/) is a task runner, the first really popular solution for NPM task running. It is generally regarded as a little crufty and inelegant these days, though it is still widely used. Its task definitions are basically just JSON blobs.

### Gulp
[Gulp](http://gulpjs.com/) is another task runner and a response to Grunt's clunkier task definitions. Task definitions look more like actual JS, and something like this:
```js
var gulp = require('gulp');
var coffee = require('gulp-coffee');
var concat = require('gulp-concat');
var uglify = require('gulp-uglify');
var imagemin = require('gulp-imagemin');
var sourcemaps = require('gulp-sourcemaps');
var del = require('del');

var paths = {
  scripts: ['client/js/**/*.coffee', '!client/external/**/*.coffee'],
  images: 'client/img/**/*'
};

// Not all tasks need to use streams
// A gulpfile is just another node program and you can use any package available on npm
gulp.task('clean', function() {
  // You can use multiple globbing patterns as you would with `gulp.src`
  return del(['build']);
});

gulp.task('scripts', ['clean'], function() {
  // Minify and copy all JavaScript (except vendor scripts)
  // with sourcemaps all the way down
  return gulp.src(paths.scripts)
    .pipe(sourcemaps.init())
      .pipe(coffee())
      .pipe(uglify())
      .pipe(concat('all.min.js'))
    .pipe(sourcemaps.write())
    .pipe(gulp.dest('build/js'));
});

// Copy all static images
gulp.task('images', ['clean'], function() {
  return gulp.src(paths.images)
    // Pass in options to the task
    .pipe(imagemin({optimizationLevel: 5}))
    .pipe(gulp.dest('build/img'));
});

// Rerun the task when a file changes
gulp.task('watch', function() {
  gulp.watch(paths.scripts, ['scripts']);
  gulp.watch(paths.images, ['images']);
});

// The default task (called when you run `gulp` from cli)
gulp.task('default', ['watch', 'scripts', 'images']);
```

### Yeoman
Scaffolding a Node.js project its significantly more difficult than something like Ruby on Rails. [Yeoman](http://yeoman.io/) is one solution this problem.

Yeoman provides a framework for creating and using generators to scaffold out Node.js projects. There are a number of generators supported by the Yeoman team, as well as many third party generators.

