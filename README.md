# mq-sass

mq-sass is a Sass library to help you manage your responsive breakpoints and easily generate media queries.

## Requirements

- Sass 3.3+
- SCSS syntax

## Installation

1. mq-sass is available on [npm](https://www.npmjs.com/package/mq-sass), yarn and [Bower](http://bower.io/search/?q=mq-sass).

  ```
  npm install mq-sass

  yarn get mq-sass

  bower install css-mq-sass
  ```

  Also available as a [Ruby gem](https://rubygems.org/gems/mq-sass) to use within your Rails application—see [below](#install-for-ruby-on-rails) for more information.

  Or to manually install it, [download](https://github.com/jonsuh/mq-sass/archive/master.zip) and unzip the source files, then copy the files from the `stylesheets/mq-sass` directory into your project.

2. Import the `_mq-sass.scss` file into your project.

  ```scss
  @import "mq-sass";
  ```

  If you're using gulp, Grunt, Compass, or alike, include mq-sass:

  ```js
  // gulp-sass gulpfile.js
  .pipe(sass({
    includePaths: ['node_modules/mq-sass/stylesheets']
  }))

  // grunt-sass Gruntfile.js
  options: {
    includePaths: ['node_modules/mq-sass/stylesheets']
  },
  ```

  ```rb
  # Compass config.rb
  add_import_path "node_modules/mq-sass/stylesheets"
  ```

### Install for Ruby on Rails

1. Add mq-sass to your Gemfile.

  ```
  gem 'mq-sass'
  ```

2. Run `bundle install`.
3. Include mq-sass by using Sass’s native `@import`*

  ```scss
  // application.scss
  @import "mq-sass";
  ```

  \* [More information](https://blog.pivotal.io/pivotal-labs/labs/structure-your-sass-files-with-import) on why Sass’s native `@import` + why you should ditch Sprockets directives altogether.

## Documentation

### Settings

```scss
$mq-breakpoints: (
  iphone  : 320px,
  iphone6 : 375px,
  iphone6p: 414px,
  small   : 480px,
  medium  : 640px,
  ipad    : 768px,
  large   : 1024px,
);

$mq-ems    : false;
$mq-em-base: 16px;

$mq-only: "only screen";
```

### `mq($breakpoint, $minmax, $widthheight)` Mixin

```scss
@include mq($breakpoint, $minmax, $widthheight) { // $minmax and $widthheight are optional
  // Sass goes here
}
```

#### `$breakpoint`

1. The first parameter, `$breakpoint`, accepts pre-defined values from the `$mq-breakpoints();` map, which is set by default as above in Settings.

  Example:

  ```scss
  @include mq(small) {
    color: white;
  }
  ```

  ```css
  /* Resulting CSS */
  @media only screen and (min-width: 480px) {
    color: white;
  }
  ```

  You can also customize your own breakpoints.

  ```scss
  $mq-breakpoints: (
    s : 600px,
    m : 800px,
    l : 1000px,
    xl: 1200px,
  );

  @include mq(xl) {
    color: blue;
  }
  ```

2. `$breakpoint` also accepts other pre-defined values:

  - portrait
  - landscape
  - retina

  Example:

  ```scss
  @include mq(portrait) {
    color: white;
  }

  @include mq(retina) {
    color: red;
  }
  ```

  ```css
  /* Resulting CSS */
  @media only screen and (orientation: portrait) {
    color: white;
  }

  @media only screen and (-webkit-min-device-pixel-ratio: 2), only screen and (min-resolution: 2dppx) {
    color: red;
  }
  ```

3. `$breakpoint` accepts custom values in px.

  Example:

  ```scss
  @include mq(700px) {
    color: white;
  }
  ```

  ```css
  /* Resulting CSS */
  @media only screen and (min-width: 700px) {
    color: white;
  }
  ```

  **Note:** You can also use unitless pixel values: `@include mq(700) {}`

#### `$minmax`

By default, media queries are mobile first (`min-width`).

`$minmax` accepts values `min` or `max`, which will result in `min-width:` or `max-width:` respectively. If left blank, it falls back to the default, `min`.

Example:

```scss
@include mq(ipad) {
  color: white;
}

@include mq(600px, max) {
  color: cyan;
}
```

```css
/* Resulting CSS */
@media only screen and (min-width: 768px) {
  color: white;
}

@media only screen and (max-width: 600px) {
  color: cyan;
}
```

#### `$widthheight`

By default, media queries that are generated are (`min/max-width`).

`$widthheight` accepts values `width` or `height`, which results in `min/max-width:` or `min/max-height:` respectively. If left blank, it falls back to the default, `width`.

Example:

```scss
@include mq(small, min, height) {
  color: cyan;
}

@include mq(600px, max, height) {
  color: pink;
}
```

```css
/* Resulting CSS */
@media only screen and (min-height: 480px) {
  color: cyan;
}

@media only screen and (max-height: 600px) {
  color: pink;
}
```

#### ems

To have media queries in ems, set `$mq-ems: true;`. The default em base is `16px`. You can change it by setting `$mq-em-base` to the pixel value of your choosing.

Examples:

```scss
$mq-ems: true;

@include mq(600px) {
  color: white;
}
```

```css
/* Resulting CSS */
@media only screen and (min-width: 37.5em) {
  color: white;
}
```

```scss
$mq-ems    : true;
$mq-em-base: 20px;

@include mq(600px) {
  color: cyan;
}
```

```css
/* Resulting CSS */
@media only screen and (min-width: 30em) {
  color: cyan;
}
```

#### media

By default the media is specified for `only screen`. For some reason if you'd like to change it or remove it completely, you can do so by changing the setting `$mq-media`:

```scss
$mq-media: "screen";
```

```css
/* Resulting CSS */
@media screen and (min-width...) {}
```

```scss
$mq-media: ""; // or false
```

```css
/* Resulting CSS */
@media (min-width...) {}
```

### `mq-get($breakpoint, $ems)` function

Returns the value of the breakpoint in pixels (by default) or ems.

```scss
.example {
  max-width: mq-get(small);
}
```

#### `$breakpoint`

`$breakpoint` accepts only pre-defined keys from the `$mq-breakpoints();` map.

```scss
$mq-breakpoints: (
  small : 480px,
  medium: 640px,
);

.example {
  max-width: mq-get(small);
}
.example2 {
  max-width: mq-get(medium);
}
```

```css
/* Resulting CSS */
.example {
  max-width: 480px;
}
.example2 {
  max-width: 640px;
}
```

#### `$ems`

`$ems` is a boolean (`false` or `true`, `false` by default) and dictates whether or not the return is in pixels or ems.

```scss
.example {
  max-width: mq-get(small);
}
.example-ems {
  max-width: mq-get(small, true);
}
```

```css
/* Resulting CSS */
.example {
  max-width: 480px;
}
.example2 {
  max-width: 30em;
}
```

## Notes

<b id="f1">1</b>. Requires [Node.js](https://nodejs.org/) [↩](#a1)

<b id="f2">2</b>. Also available on [Bower](http://bower.io/search/?q=mq-sass) [↩](#a2)

## License

The MIT License

Copyright © 2014–2016 [Jonathan Suh](https://jonsuh.com) ([@jonsuh](https://twitter.com/jonsuh))

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the “Software”), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
