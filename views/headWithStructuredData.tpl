<title>{{this._meta_title}}</title>

<meta name="description" content="{{this._meta_description}}">
<meta property="og:title" content="{{this._meta_title}}">
<meta property="og:description" content="{{this._meta_description}}">

(** setup an if check to use an og image if available, else default to brand image **)
{{if {!this.og_image} }}
<meta property="og:image" content="{{this.og_image.getImage()}}">
{{else}}
<meta property="og:image" content="https://www.example.com/default-share-image.png">
{{end-if}}

<link rel="icon" type="image/png" href="{{globals.site_icon.getImage()}}">