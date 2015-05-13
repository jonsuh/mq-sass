# mq-sass

mq-sass is a lightweight Sass library to help you manage your responsive breakpoints and easily generate media queries.

## Requirements

- Sass 3.3+
- SCSS syntax

## Installation

### Bower

1. Run:

  ```bower install mq-sass -D```

2. Import mq-sass at the top of your Sass file.

  ```scss
  @import "bower_components/mq-sass/styleshets/mq-sass";
  ```

  If you're using Grunt, Gulp, Compass, or alike, include/import mq-sass:

  ```rb
  # Compass config.rb
  add_import_path "bower_components/mq-sass/stylesheets"
  ```

  ```js
  // grunt-sass Gruntfile.js
  options: {
    includePaths: ['bower_components/mq-sass/stylesheets']
  },
  ```

  Then import mq-sass at the top of your Sass file.

  ```scss
  @import "mq-sass";
  ```

### Other

1. Download and unzip.
2. Copy the contents of the stylesheets folder to a folder within your Sass structure (i.e. `sass/mq-sass/`)
3. Import mq-sass at the top of your Sass file.

  ```scss
  @import "sass/mq-sass/mq-sass";
  ```

## Documentation

### Mixin

```scss
@include mq($breakpoint, $minmax) {
  // Sass goes here
}
```

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

### Usage

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

@include mq(ipad, max) {
  color: blue;
}

@include mq(600px) {
  color: magenta;
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

@media only screen and (max-width: 768px) {
  color: blue;
}

@media only screen and (min-width: 600px) {
  color: magenta;
}

@media only screen and (max-width: 600px) {
  color: cyan;
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

## License

The MIT License

Copyright © 2014 [Jonathan Suh](https://jonsuh.com) ([@jonsuh](https://twitter.com/jonsuh))

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