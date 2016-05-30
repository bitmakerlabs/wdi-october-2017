# The Asset Pipeline

In this lesson, we'll take a look at what's required to get your front-end assets ready for production.

## Agenda
After this lesson, you will know:

  * What is an (static) asset?
  * Best practices for deployment

## Static assets
Static assets are non-code project dependencies
- Images
- CSS
- Javascript
- Fonts
- PDFs, Sound files, etc.

```
_________________________________________
WEB SERVER STACK (via ASCII art!)

CLIENT
-------
WEB SERVER (Apache, nginx)
-------
APP SERVER (Rails server / WEBrick, Unicorn, Mongrel, Puma)
-------
DB SERVER (SQLite, PG, MySQL, MSSQL, Oracle, Firebase, MongoDB)
_________________________________________
```

## Best practices for deployment
- File Concatenation
- Minification
- Compression (GZip)

---

- Image Optimization (e.g. OptiPNG)
- Content Delivery Networks (CDN / Amazon S3 + CloudFront)


## Sprockets
The tool by which we achieve The 3 Pillars of deployment optimization


### In the production environment

For JS and CSS
- Concatenation
- Minification
- Uglify (JS Only)
- File-name digests

For Images
- File-name digests

Example file-name digest:
`application-alkgjaoth3290UT0892QU5QHGQPRHG9QWHG.js`


## Rails view helpers for asset pipeline

- `javascript_include_tag`
- `stylesheet_link_tag`

- `image_url(filename)` / SASS: `image-url`
- `font_url`
- `asset_url`
