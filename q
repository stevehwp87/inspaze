[1mdiff --git a/Gemfile b/Gemfile[m
[1mindex 5b60ce3..45af34a 100644[m
[1m--- a/Gemfile[m
[1m+++ b/Gemfile[m
[36m@@ -7,7 +7,10 @@[m [mgem 'bootstrap-sass', '3.2.0.0'[m
 gem 'social-share-button', '~> 0.1.6'[m
 gem 'font-awesome-sass'[m
 gem 'devise'[m
[31m-[m
[32m+[m[32mgem 'carrierwave'[m
[32m+[m[32mgem 'mini_magick'[m
[32m+[m[32mgem 'fog'[m
[32m+[m[32mgem 'acts-as-taggable-on', '~> 3.4'[m
 # Use sqlite3 as the database for Active Record[m
 gem 'sqlite3'[m
 # Use SCSS for stylesheets[m
[36m@@ -21,6 +24,7 @@[m [mgem 'coffee-rails', '~> 4.1.0'[m
 [m
 # Use jquery as the JavaScript library[m
 gem 'jquery-rails'[m
[32m+[m
 # Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks[m
 gem 'turbolinks'[m
 # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder[m
[1mdiff --git a/Gemfile.lock b/Gemfile.lock[m
[1mindex afb782e..ba4d3ea 100644[m
[1m--- a/Gemfile.lock[m
[1m+++ b/Gemfile.lock[m
[36m@@ -1,6 +1,7 @@[m
 GEM[m
   remote: https://rubygems.org/[m
   specs:[m
[32m+[m[32m    CFPropertyList (2.3.1)[m
     actionmailer (4.2.2)[m
       actionpack (= 4.2.2)[m
       actionview (= 4.2.2)[m
[36m@@ -36,6 +37,8 @@[m [mGEM[m
       minitest (~> 5.1)[m
       thread_safe (~> 0.3, >= 0.3.4)[m
       tzinfo (~> 1.1)[m
[32m+[m[32m    acts-as-taggable-on (3.5.0)[m
[32m+[m[32m      activerecord (>= 3.2, < 5)[m
     arel (6.0.2)[m
     bcrypt (3.1.10)[m
     binding_of_caller (0.7.2)[m
[36m@@ -45,6 +48,11 @@[m [mGEM[m
     builder (3.2.2)[m
     byebug (5.0.0)[m
       columnize (= 0.9.0)[m
[32m+[m[32m    carrierwave (0.10.0)[m
[32m+[m[32m      activemodel (>= 3.2.0)[m
[32m+[m[32m      activesupport (>= 3.2.0)[m
[32m+[m[32m      json (>= 1.7)[m
[32m+[m[32m      mime-types (>= 1.16)[m
     coffee-rails (4.1.0)[m
       coffee-script (>= 2.2.0)[m
       railties (>= 4.0.0, < 5.0)[m
[36m@@ -62,12 +70,112 @@[m [mGEM[m
       thread_safe (~> 0.1)[m
       warden (~> 1.2.3)[m
     erubis (2.7.0)[m
[32m+[m[32m    excon (0.45.4)[m
     execjs (2.5.2)[m
[32m+[m[32m    fission (0.5.0)[m
[32m+[m[32m      CFPropertyList (~> 2.2)[m
[32m+[m[32m    fog (1.32.0)[m
[32m+[m[32m      fog-atmos[m
[32m+[m[32m      fog-aws (>= 0.6.0)[m
[32m+[m[32m      fog-brightbox (~> 0.4)[m
[32m+[m[32m      fog-core (~> 1.32)[m
[32m+[m[32m      fog-ecloud (= 0.1.1)[m
[32m+[m[32m      fog-google (>= 0.0.2)[m
[32m+[m[32m      fog-json[m
[32m+[m[32m      fog-local[m
[32m+[m[32m      fog-powerdns (>= 0.1.1)[m
[32m+[m[32m      fog-profitbricks[m
[32m+[m[32m      fog-radosgw (>= 0.0.2)[m
[32m+[m[32m      fog-riakcs[m
[32m+[m[32m      fog-sakuracloud (>= 0.0.4)[m
[32m+[m[32m      fog-serverlove[m
[32m+[m[32m      fog-softlayer[m
[32m+[m[32m      fog-storm_on_demand[m
[32m+[m[32m      fog-terremark[m
[32m+[m[32m      fog-vmfusion[m
[32m+[m[32m      fog-voxel[m
[32m+[m[32m      fog-xml (~> 0.1.1)[m
[32m+[m[32m      ipaddress (~> 0.5)[m
[32m+[m[32m      nokogiri (~> 1.5, >= 1.5.11)[m
[32m+[m[32m    fog-atmos (0.1.0)[m
[32m+[m[32m      fog-core[m
[32m+[m[32m      fog-xml[m
[32m+[m[32m    fog-aws (0.7.4)[m
[32m+[m[32m      fog-core (~> 1.27)[m
[32m+[m[32m      fog-json (~> 1.0)[m
[32m+[m[32m      fog-xml (~> 0.1)[m
[32m+[m[32m      ipaddress (~> 0.8)[m
[32m+[m[32m    fog-brightbox (0.8.0)[m
[32m+[m[32m      fog-core (~> 1.22)[m
[32m+[m[32m      fog-json[m
[32m+[m[32m      inflecto (~> 0.0.2)[m
[32m+[m[32m    fog-core (1.32.0)[m
[32m+[m[32m      builder[m
[32m+[m[32m      excon (~> 0.45)[m
[32m+[m[32m      formatador (~> 0.2)[m
[32m+[m[32m      mime-types[m
[32m+[m[32m      net-scp (~> 1.1)[m
[32m+[m[32m      net-ssh (>= 2.1.3)[m
[32m+[m[32m    fog-ecloud (0.1.1)[m
[32m+[m[32m      fog-core[m
[32m+[m[32m      fog-xml[m
[32m+[m[32m    fog-google (0.0.7)[m
[32m+[m[32m      fog-core[m
[32m+[m[32m      fog-json[m
[32m+[m[32m      fog-xml[m
[32m+[m[32m    fog-json (1.0.2)[m
[32m+[m[32m      fog-core (~> 1.0)[m
[32m+[m[32m      multi_json (~> 1.10)[m
[32m+[m[32m    fog-local (0.2.1)[m
[32m+[m[32m      fog-core (~> 1.27)[m
[32m+[m[32m    fog-powerdns (0.1.1)[m
[32m+[m[32m      fog-core (~> 1.27)[m
[32m+[m[32m      fog-json (~> 1.0)[m
[32m+[m[32m      fog-xml (~> 0.1)[m
[32m+[m[32m    fog-profitbricks (0.0.5)[m
[32m+[m[32m      fog-core[m
[32m+[m[32m      fog-xml[m
[32m+[m[32m      nokogiri[m
[32m+[m[32m    fog-radosgw (0.0.4)[m
[32m+[m[32m      fog-core (>= 1.21.0)[m
[32m+[m[32m      fog-json[m
[32m+[m[32m      fog-xml (>= 0.0.1)[m
[32m+[m[32m    fog-riakcs (0.1.0)[m
[32m+[m[32m      fog-core[m
[32m+[m[32m      fog-json[m
[32m+[m[32m      fog-xml[m
[32m+[m[32m    fog-sakuracloud (1.0.1)[m
[32m+[m[32m      fog-core[m
[32m+[m[32m      fog-json[m
[32m+[m[32m    fog-serverlove (0.1.2)[m
[32m+[m[32m      fog-core[m
[32m+[m[32m      fog-json[m
[32m+[m[32m    fog-softlayer (0.4.7)[m
[32m+[m[32m      fog-core[m
[32m+[m[32m      fog-json[m
[32m+[m[32m    fog-storm_on_demand (0.1.1)[m
[32m+[m[32m      fog-core[m
[32m+[m[32m      fog-json[m
[32m+[m[32m    fog-terremark (0.1.0)[m
[32m+[m[32m      fog-core[m
[32m+[m[32m      fog-xml[m
[32m+[m[32m    fog-vmfusion (0.1.0)[m
[32m+[m[32m      fission[m
[32m+[m[32m      fog-core[m
[32m+[m[32m    fog-voxel (0.1.0)[m
[32m+[m[32m      fog-core[m
[32m+[m[32m      fog-xml[m
[32m+[m[32m    fog-xml (0.1.2)[m
[32m+[m[32m      fog-core[m
[32m+[m[32m      nokogiri (~> 1.5, >= 1.5.11)[m
     font-awesome-sass (4.3.2.1)[m
       sass (~> 3.2)[m
[32m+[m[32m    formatador (0.2.5)[m
     globalid (0.3.5)[m
       activesupport (>= 4.1.0)[m
     i18n (0.7.0)[m
[32m+[m[32m    inflecto (0.0.2)[m
[32m+[m[32m    ipaddress (0.8.0)[m
     jbuilder (2.3.1)[m
       activesupport (>= 3.0.0, < 5)[m
       multi_json (~> 1.2)[m
[36m@@ -81,9 +189,13 @@[m [mGEM[m
     mail (2.6.3)[m
       mime-types (>= 1.16, < 3)[m
     mime-types (2.6.1)[m
[32m+[m[32m    mini_magick (4.2.10)[m
     mini_portile (0.6.2)[m
     minitest (5.7.0)[m
     multi_json (1.11.2)[m
[32m+[m[32m    net-scp (1.2.1)[m
[32m+[m[32m      net-ssh (>= 2.6.5)[m
[32m+[m[32m    net-ssh (2.9.2)[m
     nokogiri (1.6.6.2)[m
       mini_portile (~> 0.6.0)[m
     orm_adapter (0.5.0)[m
[36m@@ -162,13 +274,17 @@[m [mPLATFORMS[m
   ruby[m
 [m
 DEPENDENCIES[m
[32m+[m[32m  acts-as-taggable-on (~> 3.4)[m
   bootstrap-sass (= 3.2.0.0)[m
   byebug[m
[32m+[m[32m  carrierwave[m
   coffee-rails (~> 4.1.0)[m
   devise[m
[32m+[m[32m  fog[m
   font-awesome-sass[m
   jbuilder (~> 2.0)[m
   jquery-rails[m
[32m+[m[32m  mini_magick[m
   rails (= 4.2.2)[m
   sass-rails (~> 5.0)[m
   sdoc (~> 0.4.0)[m
[1mdiff --git a/app/assets/javascripts/photos.coffee b/app/assets/javascripts/photos.coffee[m
[1mdeleted file mode 100644[m
[1mindex 24f83d1..0000000[m
[1m--- a/app/assets/javascripts/photos.coffee[m
[1m+++ /dev/null[m
[36m@@ -1,3 +0,0 @@[m
[31m-# Place all the behaviors and hooks related to the matching controller here.[m
[31m-# All this logic will automatically be available in application.js.[m
[31m-# You can use CoffeeScript in this file: http://coffeescript.org/[m
[1mdiff --git a/app/assets/stylesheets/bootstrap.css b/app/assets/stylesheets/bootstrap.css[m
[1mdeleted file mode 100644[m
[1mindex fb15e3d..0000000[m
[1m--- a/app/assets/stylesheets/bootstrap.css[m
[1m+++ /dev/null[m
[36m@@ -1,6584 +0,0 @@[m
[31m-/*![m
[31m- * Bootstrap v3.3.4 (http://getbootstrap.com)[m
[31m- * Copyright 2011-2015 Twitter, Inc.[m
[31m- * Licensed under MIT (https://github.com/twbs/bootstrap/blob/master/LICENSE)[m
[31m- */[m
[31m-[m
[31m-/*! normalize.css v3.0.2 | MIT License | git.io/normalize */[m
[31m-html {[m
[31m-  font-family: sans-serif;[m
[31m-  -webkit-text-size-adjust: 100%;[m
[31m-      -ms-text-size-adjust: 100%;[m
[31m-}[m
[31m-body {[m
[31m-  margin: 0;[m
[31m-}[m
[31m-article,[m
[31m-aside,[m
[31m-details,[m
[31m-figcaption,[m
[31m-figure,[m
[31m-footer,[m
[31m-header,[m
[31m-hgroup,[m
[31m-main,[m
[31m-menu,[m
[31m-nav,[m
[31m-section,[m
[31m-summary {[m
[31m-  display: block;[m
[31m-}[m
[31m-audio,[m
[31m-canvas,[m
[31m-progress,[m
[31m-video {[m
[31m-  display: inline-block;[m
[31m-  vertical-align: baseline;[m
[31m-}[m
[31m-audio:not([controls]) {[m
[31m-  display: none;[m
[31m-  height: 0;[m
[31m-}[m
[31m-[hidden],[m
[31m-template {[m
[31m-  display: none;[m
[31m-}[m
[31m-a {[m
[31m-  background-color: transparent;[m
[31m-}[m
[31m-a:active,[m
[31m-a:hover {[m
[31m-  outline: 0;[m
[31m-}[m
[31m-abbr[title] {[m
[31m-  border-bottom: 1px dotted;[m
[31m-}[m
[31m-b,[m
[31m-strong {[m
[31m-  font-weight: bold;[m
[31m-}[m
[31m-dfn {[m
[31m-  font-style: italic;[m
[31m-}[m
[31m-h1 {[m
[31m-  margin: .67em 0;[m
[31m-  font-size: 2em;[m
[31m-}[m
[31m-mark {[m
[31m-  color: #000;[m
[31m-  background: #ff0;[m
[31m-}[m
[31m-small {[m
[31m-  font-size: 80%;[m
[31m-}[m
[31m-sub,[m
[31m-sup {[m
[31m-  position: relative;[m
[31m-  font-size: 75%;[m
[31m-  line-height: 0;[m
[31m-  vertical-align: baseline;[m
[31m-}[m
[31m-sup {[m
[31m-  top: -.5em;[m
[31m-}[m
[31m-sub {[m
[31m-  bottom: -.25em;[m
[31m-}[m
[31m-img {[m
[31m-  border: 0;[m
[31m-}[m
[31m-svg:not(:root) {[m
[31m-  overflow: hidden;[m
[31m-}[m
[31m-figure {[m
[31m-  margin: 1em 40px;[m
[31m-}[m
[31m-hr {[m
[31m-  height: 0;[m
[31m-  -webkit-box-sizing: content-box;[m
[31m-     -moz-box-sizing: content-box;[m
[31m-          box-sizing: content-box;[m
[31m-}[m
[31m-pre {[m
[31m-  overflow: auto;[m
[31m-}[m
[31m-code,[m
[31m-kbd,[m
[31m-pre,[m
[31m-samp {[m
[31m-  font-family: monospace, monospace;[m
[31m-  font-size: 1em;[m
[31m-}[m
[31m-button,[m
[31m-input,[m
[31m-optgroup,[m
[31m-select,[m
[31m-textarea {[m
[31m-  margin: 0;[m
[31m-  font: inherit;[m
[31m-  color: inherit;[m
[31m-}[m
[31m-button {[m
[31m-  overflow: visible;[m
[31m-}[m
[31m-button,[m
[31m-select {[m
[31m-  text-transform: none;[m
[31m-}[m
[31m-button,[m
[31m-html input[type="button"],[m
[31m-input[type="reset"],[m
[31m-input[type="submit"] {[m
[31m-  -webkit-appearance: button;[m
[31m-  cursor: pointer;[m
[31m-}[m
[31m-button[disabled],[m
[31m-html input[disabled] {[m
[31m-  cursor: default;[m
[31m-}[m
[31m-button::-moz-focus-inner,[m
[31m-input::-moz-focus-inner {[m
[31m-  padding: 0;[m
[31m-  border: 0;[m
[31m-}[m
[31m-input {[m
[31m-  line-height: normal;[m
[31m-}[m
[31m-input[type="checkbox"],[m
[31m-input[type="radio"] {[m
[31m-  -webkit-box-sizing: border-box;[m
[31m-     -moz-box-sizing: border-box;[m
[31m-          box-sizing: border-box;[m
[31m-  padding: 0;[m
[31m-}[m
[31m-input[type="number"]::-webkit-inner-spin-button,[m
[31m-input[type="number"]::-webkit-outer-spin-button {[m
[31m-  height: auto;[m
[31m-}[m
[31m-input[type="search"] {[m
[31m-  -webkit-box-sizing: content-box;[m
[31m-     -moz-box-sizing: content-box;[m
[31m-          box-sizing: content-box;[m
[31m-  -webkit-appearance: textfield;[m
[31m-}[m
[31m-input[type="search"]::-webkit-search-cancel-button,[m
[31m-input[type="search"]::-webkit-search-decoration {[m
[31m-  -webkit-appearance: none;[m
[31m-}[m
[31m-fieldset {[m
[31m-  padding: .35em .625em .75em;[m
[31m-  margin: 0 2px;[m
[31m-  border: 1px solid #c0c0c0;[m
[31m-}[m
[31m-legend {[m
[31m-  padding: 0;[m
[31m-  border: 0;[m
[31m-}[m
[31m-textarea {[m
[31m-  overflow: auto;[m
[31m-}[m
[31m-optgroup {[m
[31m-  font-weight: bold;[m
[31m-}[m
[31m-table {[m
[31m-  border-spacing: 0;[m
[31m-  border-collapse: collapse;[m
[31m-}[m
[31m-td,[m
[31m-th {[m
[31m-  padding: 0;[m
[31m-}[m
[31m-/*! Source: https://github.com/h5bp/html5-boilerplate/blob/master/src/css/main.css */[m
[31m-@media print {[m
[31m-  *,[m
[31m-  *:before,[m
[31m-  *:after {[m
[31m-    color: #000 !important;[m
[31m-    text-shadow: none !important;[m
[31m-    background: transparent !important;[m
[31m-    -webkit-box-shadow: none !important;[m
[31m-            box-shadow: none !important;[m
[31m-  }[m
[31m-  a,[m
[31m-  a:visited {[m
[31m-    text-decoration: underline;[m
[31m-  }[m
[31m-  a[href]:after {[m
[31m-    content: " (" attr(href) ")";[m
[31m-  }[m
[31m-  abbr[title]:after {[m
[31m-    content: " (" attr(title) ")";[m
[31m-  }[m
[31m-  a[href^="#"]:after,[m
[31m-  a[href^="javascript:"]:after {[m
[31m-    content: "";[m
[31m-  }[m
[31m-  pre,[m
[31m-  blockquote {[m
[31m-    border: 1px solid #999;[m
[31m-[m
[31m-    page-break-inside: avoid;[m
[31m-  }[m
[31m-  thead {[m
[31m-    display: table-header-group;[m
[31m-  }[m
[31m-  tr,[m
[31m-  img {[m
[31m-    page-break-inside: avoid;[m
[31m-  }[m
[31m-  img {[m
[31m-    max-width: 100% !important;[m
[31m-  }[m
[31m-  p,[m
[31m-  h2,[m
[31m-  h3 {[m
[31m-    orphans: 3;[m
[31m-    widows: 3;[m
[31m-  }[m
[31m-  h2,[m
[31m-  h3 {[m
[31m-    page-break-after: avoid;[m
[31m-  }[m
[31m-  select {[m
[31m-    background: #fff !important;[m
[31m-  }[m
[31m-  .navbar {[m
[31m-    display: none;[m
[31m-  }[m
[31m-  .btn > .caret,[m
[31m-  .dropup > .btn > .caret {[m
[31m-    border-top-color: #000 !important;[m
[31m-  }[m
[31m-  .label {[m
[31m-    border: 1px solid #000;[m
[31m-  }[m
[31m-  .table {[m
[31m-    border-collapse: collapse !important;[m
[31m-  }[m
[31m-  .table td,[m
[31m-  .table th {[m
[31m-    background-color: #fff !important;[m
[31m-  }[m
[31m-  .table-bordered th,[m
[31m-  .table-bordered td {[m
[31m-    border: 1px solid #ddd !important;[m
[31m-  }[m
[31m-}[m
[31m-@font-face {[m
[31m-  font-family: 'Glyphicons Halflings';[m
[31m-[m
[31m-  src: url('../fonts/glyphicons-halflings-regular.eot');[m
[31m-  src: url('../fonts/glyphicons-halflings-regular.eot?#iefix') format('embedded-opentype'), url('../fonts/glyphicons-halflings-regular.woff2') format('woff2'), url('../fonts/glyphicons-halflings-regular.woff') format('woff'), url('../fonts/glyphicons-halflings-regular.ttf') format('truetype'), url('../fonts/glyphicons-halflings-regular.svg#glyphicons_halflingsregular') format('svg');[m
[31m-}[m
[31m-.glyphicon {[m
[31m-  position: relative;[m
[31m-  top: 1px;[m
[31m-  display: inline-block;[m
[31m-  font-family: 'Glyphicons Halflings';[m
[31m-  font-style: normal;[m
[31m-  font-weight: normal;[m
[31m-  line-height: 1;[m
[31m-[m
[31m-  -webkit-font-smoothing: antialiased;[m
[31m-  -moz-osx-font-smoothing: grayscale;[m
[31m-}[m
[31m-.glyphicon-asterisk:before {[m
[31m-  content: "\2a";[m
[31m-}[m
[31m-.glyphicon-plus:before {[m
[31m-  content: "\2b";[m
[31m-}[m
[31m-.glyphicon-euro:before,[m
[31m-.glyphicon-eur:before {[m
[31m-  content: "\20ac";[m
[31m-}[m
[31m-.glyphicon-minus:before {[m
[31m-  content: "\2212";[m
[31m-}[m
[31m-.glyphicon-cloud:before {[m
[31m-  content: "\2601";[m
[31m-}[m
[31m-.glyphicon-envelope:before {[m
[31m-  content: "\2709";[m
[31m-}[m
[31m-.glyphicon-pencil:before {[m
[31m-  content: "\270f";[m
[31m-}[m
[31m-.glyphicon-glass:before {[m
[31m-  content: "\e001";[m
[31m-}[m
[31m-.glyphicon-music:before {[m
[31m-  content: "\e002";[m
[31m-}[m
[31m-.glyphicon-search:before {[m
[31m-  content: "\e003";[m
[31m-}[m
[31m-.glyphicon-heart:before {[m
[31m-  content: "\e005";[m
[31m-}[m
[31m-.glyphicon-star:before {[m
[31m-  content: "\e006";[m
[31m-}[m
[31m-.glyphicon-star-empty:before {[m
[31m-  content: "\e007";[m
[31m-}[m
[31m-.glyphicon-user:before {[m
[31m-  content: "\e008";[m
[31m-}[m
[31m-.glyphicon-film:before {[m
[31m-  content: "\e009";[m
[31m-}[m
[31m-.glyphicon-th-large:before {[m
[31m-  content: "\e010";[m
[31m-}[m
[31m-.glyphicon-th:before {[m
[31m-  content: "\e011";[m
[31m-}[m
[31m-.glyphicon-th-list:before {[m
[31m-  content: "\e012";[m
[31m-}[m
[31m-.glyphicon-ok:before {[m
[31m-  content: "\e013";[m
[31m-}[m
[31m-.glyphicon-remove:before {[m
[31m-  content: "\e014";[m
[31m-}[m
[31m-.glyphicon-zoom-in:before {[m
[31m-  content: "\e015";[m
[31m-}[m
[31m-.glyphicon-zoom-out:before {[m
[31m-  content: "\e016";[m
[31m-}[m
[31m-.glyphicon-off:before {[m
[31m-  content: "\e017";[m
[31m-}[m
[31m-.glyphicon-signal:before {[m
[31m-  content: "\e018";[m
[31m-}[m
[31m-.glyphicon-cog:before {[m
[31m-  content: "\e019";[m
[31m-}[m
[31m-.glyphicon-trash:before {[m
[31m-  content: "\e020";[m
[31m-}[m
[31m-.glyphicon-home:before {[m
[31m-  content: "\e021";[m
[31m-}[m
[31m-.glyphicon-file:before {[m
[31m-  content: "\e022";[m
[31m-}[m
[31m-.glyphicon-time:before {[m
[31m-  content: "\e023";[m
[31m-}[m
[31m-.glyphicon-road:before {[m
[31m-  content: "\e024";[m
[31m-}[m
[31m-.glyphicon-download-alt:before {[m
[31m-  content: "\e025";[m
[31m-}[m
[31m-.glyphicon-download:before {[m
[31m-  content: "\e026";[m
[31m-}[m
[31m-.glyphicon-upload:before {[m
[31m-  content: "\e027";[m
[31m-}[m
[31m-.glyphicon-inbox:before {[m
[31m-  content: "\e028";[m
[31m-}[m
[31m-.glyphicon-play-circle:before {[m
[31m-  content: "\e029";[m
[31m-}[m
[31m-.glyphicon-repeat:before {[m
[31m-  content: "\e030";[m
[31m-}[m
[31m-.glyphicon-refresh:before {[m
[31m-  content: "\e031";[m
[31m-}[m
[31m-.glyphicon-list-alt:before {[m
[31m-  content: "\e032";[m
[31m-}[m
[31m-.glyphicon-lock:before {[m
[31m-  content: "\e033";[m
[31m-}[m
[31m-.glyphicon-flag:before {[m
[31m-  content: "\e034";[m
[31m-}[m
[31m-.glyphicon-headphones:before {[m
[31m-  content: "\e035";[m
[31m-}[m
[31m-.glyphicon-volume-off:before {[m
[31m-  content: "\e036";[m
[31m-}[m
[31m-.glyphicon-volume-down:before {[m
[31m-  content: "\e037";[m
[31m-}[m
[31m-.glyphicon-volume-up:before {[m
[31m-  content: "\e038";[m
[31m-}[m
[31m-.glyphicon-qrcode:before {[m
[31m-  content: "\e039";[m
[31m-}[m
[31m-.glyphicon-barcode:before {[m
[31m-  content: "\e040";[m
[31m-}[m
[31m-.glyphicon-tag:before {[m
[31m-  content: "\e041";[m
[31m-}[m
[31m-.glyphicon-tags:before {[m
[31m-  content: "\e042";[m
[31m-}[m
[31m-.glyphicon-book:before {[m
[31m-  content: "\e043";[m
[31m-}[m
[31m-.glyphicon-bookmark:before {[m
[31m-  content: "\e044";[m
[31m-}[m
[31m-.glyphicon-print:before {[m
[31m-  content: "\e045";[m
[31m-}[m
[31m-.glyphicon-camera:before {[m
[31m-  content: "\e046";[m
[31m-}[m
[31m-.glyphicon-font:before {[m
[31m-  content: "\e047";[m
[31m-}[m
[31m-.glyphicon-bold:before {[m
[31m-  content: "\e048";[m
[31m-}[m
[31m-.glyphicon-italic:before {[m
[31m-  content: "\e049";[m
[31m-}[m
[31m-.glyphicon-text-height:before {[m
[31m-  content: "\e050";[m
[31m-}[m
[31m-.glyphicon-text-width:before {[m
[31m-  content: "\e051";[m
[31m-}[m
[31m-.glyphicon-align-left:before {[m
[31m-  content: "\e052";[m
[31m-}[m
[31m-.glyphicon-align-center:before {[m
[31m-  content: "\e053";[m
[31m-}[m
[31m-.glyphicon-align-right:before {[m
[31m-  content: "\e054";[m
[31m-}[m
[31m-.glyphicon-align-justify:before {[m
[31m-  content: "\e055";[m
[31m-}[m
[31m-.glyphicon-list:before {[m
[31m-  content: "\e056";[m
[31m-}[m
[31m-.glyphicon-indent-left:before {[m
[31m-  content: "\e057";[m
[31m-}[m
[31m-.glyphicon-indent-right:before {[m
[31m-  content: "\e058";[m
[31m-}[m
[31m-.glyphicon-facetime-video:before {[m
[31m-  content: "\e059";[m
[31m-}[m
[31m-.glyphicon-picture:before {[m
[31m-  content: "\e060";[m
[31m-}[m
[31m-.glyphicon-map-marker:before {[m
[31m-  content: "\e062";[m
[31m-}[m
[31m-.glyphicon-adjust:before {[m
[31m-  content: "\e063";[m
[31m-}[m
[31m-.glyphicon-tint:before {[m
[31m-  content: "\e064";[m
[31m-}[m
[31m-.glyphicon-edit:before {[m
[31m-  content: "\e065";[m
[31m-}[m
[31m-.glyphicon-share:before {[m
[31m-  content: "\e066";[m
[31m-}[m
[31m-.glyphicon-check:before {[m
[31m-  content: "\e067";[m
[31m-}[m
[31m-.glyphicon-move:before {[m
[31m-  content: "\e068";[m
[31m-}[m
[31m-.glyphicon-step-backward:before {[m
[31m-  content: "\e069";[m
[31m-}[m
[31m-.glyphicon-fast-backward:before {[m
[31m-  content: "\e070";[m
[31m-}[m
[31m-.glyphicon-backward:before {[m
[31m-  content: "\e071";[m
[31m-}[m
[31m-.glyphicon-play:before {[m
[31m-  content: "\e072";[m
[31m-}[m
[31m-.glyphicon-pause:before {[m
[31m-  content: "\e073";[m
[31m-}[m
[31m-.glyphicon-stop:before {[m
[31m-  content: "\e074";[m
[31m-}[m
[31m-.glyphicon-forward:before {[m
[31m-  content: "\e075";[m
[31m-}[m
[31m-.glyphicon-fast-forward:before {[m
[31m-  content: "\e076";[m
[31m-}[m
[31m-.glyphicon-step-forward:before {[m
[31m-  content: "\e077";[m
[31m-}[m
[31m-.glyphicon-eject:before {[m
[31m-  content: "\e078";[m
[31m-}[m
[31m-.glyphicon-chevron-left:before {[m
[31m-  content: "\e079";[m
[31m-}[m
[31m-.glyphicon-chevron-right:before {[m
[31m-  content: "\e080";[m
[31m-}[m
[31m-.glyphicon-plus-sign:before {[m
[31m-  content: "\e081";[m
[31m-}[m
[31m-.glyphicon-minus-sign:before {[m
[31m-  content: "\e082";[m
[31m-}[m
[31m-.glyphicon-remove-sign:before {[m
[31m-  content: "\e083";[m
[31m-}[m
[31m-.glyphicon-ok-sign:before {[m
[31m-  content: "\e084";[m
[31m-}[m
[31m-.glyphicon-question-sign:before {[m
[31m-  content: "\e085";[m
[31m-}[m
[31m-.glyphicon-info-sign:before {[m
[31m-  content: "\e086";[m
[31m-}[m
[31m-.glyphicon-screenshot:before {[m
[31m-  content: "\e087";[m
[31m-}[m
[31m-.glyphicon-remove-circle:before {[m
[31m-  content: "\e088";[m
[31m-}[m
[31m-.glyphicon-ok-circle:before {[m
[31m-  content: "\e089";[m
[31m-}[m
[31m-.glyphicon-ban-circle:before {[m
[31m-  content: "\e090";[m
[31m-}[m
[31m-.glyphicon-arrow-left:before {[m
[31m-  content: "\e091";[m
[31m-}[m
[31m-.glyphicon-arrow-right:before {[m
[31m-  content: "\e092";[m
[31m-}[m
[31m-.glyphicon-arrow-up:before {[m
[31m-  content: "\e093";[m
[31m-}[m
[31m-.glyphicon-arrow-down:before {[m
[31m-  content: "\e094";[m
[31m-}[m
[31m-.glyphicon-share-alt:before {[m
[31m-  content: "\e095";[m
[31m-}[m
[31m-.glyphicon-resize-full:before {[m
[31m-  content: "\e096";[m
[31m-}[m
[31m-.glyphicon-resize-small:before {[m
[31m-  content: "\e097";[m
[31m-}[m
[31m-.glyphicon-exclamation-sign:before {[m
[31m-  content: "\e101";[m
[31m-}[m
[31m-.glyphicon-gift:before {[m
[31m-  content: "\e102";[m
[31m-}[m
[31m-.glyphicon-leaf:before {[m
[31m-  content: "\e103";[m
[31m-}[m
[31m-.glyphicon-fire:before {[m
[31m-  content: "\e104";[m
[31m-}[m
[31m-.glyphicon-eye-open:before {[m
[31m-  content: "\e105";[m
[31m-}[m
[31m-.glyphicon-eye-close:before {[m
[31m-  content: "\e106";[m
[31m-}[m
[31m-.glyphicon-warning-sign:before {[m
[31m-  content: "\e107";[m
[31m-}[m
[31m-.glyphicon-plane:before {[m
[31m-  content: "\e108";[m
[31m-}[m
[31m-.glyphicon-calendar:before {[m
[31m-  content: "\e109";[m
[31m-}[m
[31m-.glyphicon-random:before {[m
[31m-  content: "\e110";[m
[31m-}[m
[31m-.glyphicon-comment:before {[m
[31m-  content: "\e111";[m
[31m-}[m
[31m-.glyphicon-magnet:before {[m
[31m-  content: "\e112";[m
[31m-}[m
[31m-.glyphicon-chevron-up:before {[m
[31m-  content: "\e113";[m
[31m-}[m
[31m-.glyphicon-chevron-down:before {[m
[31m-  content: "\e114";[m
[31m-}[m
[31m-.glyphicon-retweet:before {[m
[31m-  content: "\e115";[m
[31m-}[m
[31m-.glyphicon-shopping-cart:before {[m
[31m-  content: "\e116";[m
[31m-}[m
[31m-.glyphicon-folder-close:before {[m
[31m-  content: "\e117";[m
[31m-}[m
[31m-.glyphicon-folder-open:before {[m
[31m-  content: "\e118";[m
[31m-}[m
[31m-.glyphicon-resize-vertical:before {[m
[31m-  content: "\e119";[m
[31m-}[m
[31m-.glyphicon-resize-horizontal:before {[m
[31m-  content: "\e120";[m
[31m-}[m
[31m-.glyphicon-hdd:before {[m
[31m-  content: "\e121";[m
[31m-}[m
[31m-.glyphicon-bullhorn:before {[m
[31m-  content: "\e122";[m
[31m-}[m
[31m-.glyphicon-bell:before {[m
[31m-  content: "\e123";[m
[31m-}[m
[31m-.glyphicon-certificate:before {[m
[31m-  content: "\e124";[m
[31m-}[m
[31m-.glyphicon-thumbs-up:before {[m
[31m-  content: "\e125";[m
[31m-}[m
[31m-.glyphicon-thumbs-down:before {[m
[31m-  content: "\e126";[m
[31m-}[m
[31m-.glyphicon-hand-right:before {[m
[31m-  content: "\e127";[m
[31m-}[m
[31m-.glyphicon-hand-left:before {[m
[31m-  content: "\e128";[m
[31m-}[m
[31m-.glyphicon-hand-up:before {[m
[31m-  content: "\e129";[m
[31m-}[m
[31m-.glyphicon-hand-down:before {[m
[31m-  content: "\e130";[m
[31m-}[m
[31m-.glyphicon-circle-arrow-right:before {[m
[31m-  content: "\e131";[m
[31m-}[m
[31m-.glyphicon-circle-arrow-left:before {[m
[31m-  content: "\e132";[m
[31m-}[m
[31m-.glyphicon-circle-arrow-up:before {[m
[31m-  content: "\e133";[m
[31m-}[m
[31m-.glyphicon-circle-arrow-down:before {[m
[31m-  content: "\e134";[m
[31m-}[m
[31m-.glyphicon-globe:before {[m
[31m-  content: "\e135";[m
[31m-}[m
[31m-.glyphicon-wrench:before {[m
[31m-  content: "\e136";[m
[31m-}[m
[31m-.glyphicon-tasks:before {[m
[31m-  content: "\e137";[m
[31m-}[m
[31m-.glyphicon-filter:before {[m
[31m-  content: "\e138";[m
[31m-}[m
[31m-.glyphicon-briefcase:before {[m
[31m-  content: "\e139";[m
[31m-}[m
[31m-.glyphicon-fullscreen:before {[m
[31m-  content: "\e140";[m
[31m-}[m
[31m-.glyphicon-dashboard:before {[m
[31m-  content: "\e141";[m
[31m-}[m
[31m-.glyphicon-paperclip:before {[m
[31m-  content: "\e142";[m
[31m-}[m
[31m-.glyphicon-heart-empty:before {[m
[31m-  content: "\e143";[m
[31m-}[m
[31m-.glyphicon-link:before {[m
[31m-  content: "\e144";[m
[31m-}[m
[31m-.glyphicon-phone:before {[m
[31m-  content: "\e145";[m
[31m-}[m
[31m-.glyphicon-pushpin:before {[m
[31m-  content: "\e146";[m
[31m-}[m
[31m-.glyphicon-usd:before {[m
[31m-  content: "\e148";[m
[31m-}[m
[31m-.glyphicon-gbp:before {[m
[31m-  content: "\e149";[m
[31m-}[m
[31m-.glyphicon-sort:before {[m
[31m-  content: "\e150";[m
[31m-}[m
[31m-.glyphicon-sort-by-alphabet:before {[m
[31m-  content: "\e151";[m
[31m-}[m
[31m-.glyphicon-sort-by-alphabet-alt:before {[m
[31m-  content: "\e152";[m
[31m-}[m
[31m-.glyphicon-sort-by-order:before {[m
[31m-  content: "\e153";[m
[31m-}[m
[31m-.glyphicon-sort-by-order-alt:before {[m
[31m-  content: "\e154";[m
[31m-}[m
[31m-.glyphicon-sort-by-attributes:before {[m
[31m-  content: "\e155";[m
[31m-}[m
[31m-.glyphicon-sort-by-attributes-alt:before {[m
[31m-  content: "\e156";[m
[31m-}[m
[31m-.glyphicon-unchecked:before {[m
[31m-  content: "\e157";[m
[31m-}[m
[31m-.glyphicon-expand:before {[m
[31m-  content: "\e158";[m
[31m-}[m
[31m-.glyphicon-collapse-down:before {[m
[31m-  content: "\e159";[m
[31m-}[m
[31m-.glyphicon-collapse-up:before {[m
[31m-  content: "\e160";[m
[31m-}[m
[31m-.glyphicon-log-in:before {[m
[31m-  content: "\e161";[m
[31m-}[m
[31m-.glyphicon-flash:before {[m
[31m-  content: "\e162";[m
[31m-}[m
[31m-.glyphicon-log-out:before {[m
[31m-  content: "\e163";[m
[31m-}[m
[31m-.glyphicon-new-window:before {[m
[31m-  content: "\e164";[m
[31m-}[m
[31m-.glyphicon-record:before {[m
[31m-  content: "\e165";[m
[31m-}[m
[31m-.glyphicon-save:before {[m
[31m-  content: "\e166";[m
[31m-}[m
[31m-.glyphicon-open:before {[m
[31m-  content: "\e167";[m
[31m-}[m
[31m-.glyphicon-saved:before {[m
[31m-  content: "\e168";[m
[31m-}[m
[31m-.glyphicon-import:before {[m
[31m-  content: "\e169";[m
[31m-}[m
[31m-.glyphicon-export:before {[m
[31m-  content: "\e170";[m
[31m-}[m
[31m-.glyphicon-send:before {[m
[31m-  content: "\e171";[m
[31m-}[m
[31m-.glyphicon-floppy-disk:before {[m
[31m-  content: "\e172";[m
[31m-}[m
[31m-.glyphicon-floppy-saved:before {[m
[31m-  content: "\e173";[m
[31m-}[m
[31m-.glyphicon-floppy-remove:before {[m
[31m-  content: "\e174";[m
[31m-}[m
[31m-.glyphicon-floppy-save:before {[m
[31m-  content: "\e175";[m
[31m-}[m
[31m-.glyphicon-floppy-open:before {[m
[31m-  content: "\e176";[m
[31m-}[m
[31m-.glyphicon-credit-card:before {[m
[31m-  content: "\e177";[m
[31m-}[m
[31m-.glyphicon-transfer:before {[m
[31m-  content: "\e178";[m
[31m-}[m
[31m-.glyphicon-cutlery:before {[m
[31m-  content: "\e179";[m
[31m-}[m
[31m-.glyphicon-header:before {[m
[31m-  content: "\e180";[m
[31m-}[m
[31m-.glyphicon-compressed:before {[m
[31m-  content: "\e181";[m
[31m-}[m
[31m-.glyphicon-earphone:before {[m
[31m-  content: "\e182";[m
[31m-}[m
[31m-.glyphicon-phone-alt:before {[m
[31m-  content: "\e183";[m
[31m-}[m
[31m-.glyphicon-tower:before {[m
[31m-  content: "\e184";[m
[31m-}[m
[31m-.glyphicon-stats:before {[m
[31m-  content: "\e185";[m
[31m-}[m
[31m-.glyphicon-sd-video:before {[m
[31m-  content: "\e186";[m
[31m-}[m
[31m-.glyphicon-hd-video:before {[m
[31m-  content: "\e187";[m
[31m-}[m
[31m-.glyphicon-subtitles:before {[m
[31m-  content: "\e188";[m
[31m-}[m
[31m-.glyphicon-sound-stereo:before {[m
[31m-  content: "\e189";[m
[31m-}[m
[31m-.glyphicon-sound-dolby:before {[m
[31m-  content: "\e190";[m
[31m-}[m
[31m-.glyphicon-sound-5-1:before {[m
[31m-  content: "\e191";[m
[31m-}[m
[31m-.glyphicon-sound-6-1:before {[m
[31m-  content: "\e192";[m
[31m-}[m
[31m-.glyphicon-sound-7-1:before {[m
[31m-  content: "\e193";[m
[31m-}[m
[31m-.glyphicon-copyright-mark:before {[m
[31m-  content: "\e194";[m
[31m-}[m
[31m-.glyphicon-registration-mark:before {[m
[31m-  content: "\e195";[m
[31m-}[m
[31m-.glyphicon-cloud-download:before {[m
[31m-  content: "\e197";[m
[31m-}[m
[31m-.glyphicon-cloud-upload:before {[m
[31m-  content: "\e198";[m
[31m-}[m
[31m-.glyphicon-tree-conifer:before {[m
[31m-  content: "\e199";[m
[31m-}[m
[31m-.glyphicon-tree-deciduous:before {[m
[31m-  content: "\e200";[m
[31m-}[m
[31m-.glyphicon-cd:before {[m
[31m-  content: "\e201";[m
[31m-}[m
[31m-.glyphicon-save-file:before {[m
[31m-  content: "\e202";[m
[31m-}[m
[31m-.glyphicon-open-file:before {[m
[31m-  content: "\e203";[m
[31m-}[m
[31m-.glyphicon-level-up:before {[m
[31m-  content: "\e204";[m
[31m-}[m
[31m-.glyphicon-copy:before {[m
[31m-  content: "\e205";[m
[31m-}[m
[31m-.glyphicon-paste:before {[m
[31m-  content: "\e206";[m
[31m-}[m
[31m-.glyphicon-alert:before {[m
[31m-  content: "\e209";[m
[31m-}[m
[31m-.glyphicon-equalizer:before {[m
[31m-  content: "\e210";[m
[31m-}[m
[31m-.glyphicon-king:before {[m
[31m-  content: "\e211";[m
[31m-}[m
[31m-.glyphicon-queen:before {[m
[31m-  content: "\e212";[m
[31m-}[m
[31m-.glyphicon-pawn:before {[m
[31m-  content: "\e213";[m
[31m-}[m
[31m-.glyphicon-bishop:before {[m
[31m-  content: "\e214";[m
[31m-}[m
[31m-.glyphicon-knight:before {[m
[31m-  content: "\e215";[m
[31m-}[m
[31m-.glyphicon-baby-formula:before {[m
[31m-  content: "\e216";[m
[31m-}[m
[31m-.glyphicon-tent:before {[m
[31m-  content: "\26fa";[m
[31m-}[m
[31m-.glyphicon-blackboard:before {[m
[31m-  content: "\e218";[m
[31m-}[m
[31m-.glyphicon-bed:before {[m
[31m-  content: "\e219";[m
[31m-}[m
[31m-.glyphicon-apple:before {[m
[31m-  content: "\f8ff";[m
[31m-}[m
[31m-.glyphicon-erase:before {[m
[31m-  content: "\e221";[m
[31m-}[m
[31m-.glyphicon-hourglass:before {[m
[31m-  content: "\231b";[m
[31m-}[m
[31m-.glyphicon-lamp:before {[m
[31m-  content: "\e223";[m
[31m-}[m
[31m-.glyphicon-duplicate:before {[m
[31m-  content: "\e224";[m
[31m-}[m
[31m-.glyphicon-piggy-bank:before {[m
[31m-  content: "\e225";[m
[31m-}[m
[31m-.glyphicon-scissors:before {[m
[31m-  content: "\e226";[m
[31m-}[m
[31m-.glyphicon-bitcoin:before {[m
[31m-  content: "\e227";[m
[31m-}[m
[31m-.glyphicon-btc:before {[m
[31m-  content: "\e227";[m
[31m-}[m
[31m-.glyphicon-xbt:before {[m
[31m-  content: "\e227";[m
[31m-}[m
[31m-.glyphicon-yen:before {[m
[31m-  content: "\00a5";[m
[31m-}[m
[31m-.glyphicon-jpy:before {[m
[31m-  content: "\00a5";[m
[31m-}[m
[31m-.glyphicon-ruble:before {[m
[31m-  content: "\20bd";[m
[31m-}[m
[31m-.glyphicon-rub:before {[m
[31m-  content: "\20bd";[m
[31m-}[m
[31m-.glyphicon-scale:before {[m
[31m-  content: "\e230";[m
[31m-}[m
[31m-.glyphicon-ice-lolly:before {[m
[31m-  content: "\e231";[m
[31m-}[m
[31m-.glyphicon-ice-lolly-tasted:before {[m
[31m-  content: "\e232";[m
[31m-}[m
[31m-.glyphicon-education:before {[m
[31m-  content: "\e233";[m
[31m-}[m
[31m-.glyphicon-option-horizontal:before {[m
[31m-  content: "\e234";[m
[31m-}[m
[31m-.glyphicon-option-vertical:before {[m
[31m-  content: "\e235";[m
[31m-}[m
[31m-.glyphicon-menu-hamburger:before {[m
[31m-  content: "\e236";[m
[31m-}[m
[31m-.glyphicon-modal-window:before {[m
[31m-  content: "\e237";[m
[31m-}[m
[31m-.glyphicon-oil:before {[m
[31m-  content: "\e238";[m
[31m-}[m
[31m-.glyphicon-grain:before {[m
[31m-  content: "\e239";[m
[31m-}[m
[31m-.glyphicon-sunglasses:before {[m
[31m-  content: "\e240";[m
[31m-}[m
[31m-.glyphicon-text-size:before {[m
[31m-  content: "\e241";[m
[31m-}[m
[31m-.glyphicon-text-color:before {[m
[31m-  content: "\e242";[m
[31m-}[m
[31m-.glyphicon-text-background:before {[m
[31m-  content: "\e243";[m
[31m-}[m
[31m-.glyphicon-object-align-top:before {[m
[31m-  content: "\e244";[m
[31m-}[m
[31m-.glyphicon-object-align-bottom:before {[m
[31m-  content: "\e245";[m
[31m-}[m
[31m-.glyphicon-object-align-horizontal:before {[m
[31m-  content: "\e246";[m
[31m-}[m
[31m-.glyphicon-object-align-left:before {[m
[31m-  content: "\e247";[m
[31m-}[m
[31m-.glyphicon-object-align-vertical:before {[m
[31m-  content: "\e248";[m
[31m-}[m
[31m-.glyphicon-object-align-right:before {[m
[31m-  content: "\e249";[m
[31m-}[m
[31m-.glyphicon-triangle-right:before {[m
[31m-  content: "\e250";[m
[31m-}[m
[31m-.glyphicon-triangle-left:before {[m
[31m-  content: "\e251";[m
[31m-}[m
[31m-.glyphicon-triangle-bottom:before {[m
[31m-  content: "\e252";[m
[31m-}[m
[31m-.glyphicon-triangle-top:before {[m
[31m-  content: "\e253";[m
[31m-}[m
[31m-.glyphicon-console:before {[m
[31m-  content: "\e254";[m
[31m-}[m
[31m-.glyphicon-superscript:before {[m
[31m-  content: "\e255";[m
[31m-}[m
[31m-.glyphicon-subscript:before {[m
[31m-  content: "\e256";[m
[31m-}[m
[31m-.glyphicon-menu-left:before {[m
[31m-  content: "\e257";[m
[31m-}[m
[31m-.glyphicon-menu-right:before {[m
[31m-  content: "\e258";[m
[31m-}[m
[31m-.glyphicon-menu-down:before {[m
[31m-  content: "\e259";[m
[31m-}[m
[31m-.glyphicon-menu-up:before {[m
[31m-  content: "\e260";[m
[31m-}[m
[31m-* {[m
[31m-  -webkit-box-sizing: border-box;[m
[31m-     -moz-box-sizing: border-box;[m
[31m-          box-sizing: border-box;[m
[31m-}[m
[31m-*:before,[m
[31m-*:after {[m
[31m-  -webkit-box-sizing: border-box;[m
[31m-     -moz-box-sizing: border-box;[m
[31m-          box-sizing: border-box;[m
[31m-}[m
[31m-html {[m
[31m-  font-size: 10px;[m
[31m-[m
[31m-  -webkit-tap-highlight-color: rgba(0, 0, 0, 0);[m
[31m-}[m
[31m-body {[m
[31m-  font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;[m
[31m-  font-size: 14px;[m
[31m-  line-height: 1.42857143;[m
[31m-  color: #333;[m
[31m-  background-color: #fff;[m
[31m-}[m
[31m-input,[m
[31m-button,[m
[31m-select,[m
[31m-textarea {[m
[31m-  font-family: inherit;[m
[31m-  font-size: inherit;[m
[31m-  line-height: inherit;[m
[31m-}[m
[31m-a {[m
[31m-  color: #337ab7;[m
[31m-  text-decoration: none;[m
[31m-}[m
[31m-a:hover,[m
[31m-a:focus {[m
[31m-  color: #23527c;[m
[31m-  text-decoration: underline;[m
[31m-}[m
[31m-a:focus {[m
[31m-  outline: thin dotted;[m
[31m-  outline: 5px auto -webkit-focus-ring-color;[m
[31m-  outline-offset: -2px;[m
[31m-}[m
[31m-figure {[m
[31m-  margin: 0;[m
[31m-}[m
[31m-img {[m
[31m-  vertical-align: middle;[m
[31m-}[m
[31m-.img-responsive,[m
[31m-.thumbnail > img,[m
[31m-.thumbnail a > img,[m
[31m-.carousel-inner > .item > img,[m
[31m-.carousel-inner > .item > a > img {[m
[31m-  display: block;[m
[31m-  max-width: 100%;[m
[31m-  height: auto;[m
[31m-}[m
[31m-.img-rounded {[m
[31m-  border-radius: 6px;[m
[31m-}[m
[31m-.img-thumbnail {[m
[31m-  display: inline-block;[m
[31m-  max-width: 100%;[m
[31m-  height: auto;[m
[31m-  padding: 4px;[m
[31m-  line-height: 1.42857143;[m
[31m-  background-color: #fff;[m
[31m-  border: 1px solid #ddd;[m
[31m-  border-radius: 4px;[m
[31m-  -webkit-transition: all .2s ease-in-out;[m
[31m-       -o-transition: all .2s ease-in-out;[m
[31m-          transition: all .2s ease-in-out;[m
[31m-}[m
[31m-.img-circle {[m
[31m-  border-radius: 50%;[m
[31m-}[m
[31m-hr {[m
[31m-  margin-top: 20px;[m
[31m-  margin-bottom: 20px;[m
[31m-  border: 0;[m
[31m-  border-top: 1px solid #eee;[m
[31m-}[m
[31m-.sr-only {[m
[31m-  position: absolute;[m
[31m-  width: 1px;[m
[31m-  height: 1px;[m
[31m-  padding: 0;[m
[31m-  margin: -1px;[m
[31m-  overflow: hidden;[m
[31m-  clip: rect(0, 0, 0, 0);[m
[31m-  border: 0;[m
[31m-}[m
[31m-.sr-only-focusable:active,[m
[31m-.sr-only-focusable:focus {[m
[31m-  position: static;[m
[31m-  width: auto;[m
[31m-  height: auto;[m
[31m-  margin: 0;[m
[31m-  overflow: visible;[m
[31m-  clip: auto;[m
[31m-}[m
[31m-[role="button"] {[m
[31m-  cursor: pointer;[m
[31m-}[m
[31m-h1,[m
[31m-h2,[m
[31m-h3,[m
[31m-h4,[m
[31m-h5,[m
[31m-h6,[m
[31m-.h1,[m
[31m-.h2,[m
[31m-.h3,[m
[31m-.h4,[m
[31m-.h5,[m
[31m-.h6 {[m
[31m-  font-family: inherit;[m
[31m-  font-weight: 500;[m
[31m-  line-height: 1.1;[m
[31m-  color: inherit;[m
[31m-}[m
[31m-h1 small,[m
[31m-h2 small,[m
[31m-h3 small,[m
[31m-h4 small,[m
[31m-h5 small,[m
[31m-h6 small,[m
[31m-.h1 small,[m
[31m-.h2 small,[m
[31m-.h3 small,[m
[31m-.h4 small,[m
[31m-.h5 small,[m
[31m-.h6 small,[m
[31m-h1 .small,[m
[31m-h2 .small,[m
[31m-h3 .small,[m
[31m-h4 .small,[m
[31m-h5 .small,[m
[31m-h6 .small,[m
[31m-.h1 .small,[m
[31m-.h2 .small,[m
[31m-.h3 .small,[m
[31m-.h4 .small,[m
[31m-.h5 .small,[m
[31m-.h6 .small {[m
[31m-  font-weight: normal;[m
[31m-  line-height: 1;[m
[31m-  color: #777;[m
[31m-}[m
[31m-h1,[m
[31m-.h1,[m
[31m-h2,[m
[31m-.h2,[m
[31m-h3,[m
[31m-.h3 {[m
[31m-  margin-top: 20px;[m
[31m-  margin-bottom: 10px;[m
[31m-}[m
[31m-h1 small,[m
[31m-.h1 small,[m
[31m-h2 small,[m
[31m-.h2 small,[m
[31m-h3 small,[m
[31m-.h3 small,[m
[31m-h1 .small,[m
[31m-.h1 .small,[m
[31m-h2 .small,[m
[31m-.h2 .small,[m
[31m-h3 .small,[m
[31m-.h3 .small {[m
[31m-  font-size: 65%;[m
[31m-}[m
[31m-h4,[m
[31m-.h4,[m
[31m-h5,[m
[31m-.h5,[m
[31m-h6,[m
[31m-.h6 {[m
[31m-  margin-top: 10px;[m
[31m-  margin-bottom: 10px;[m
[31m-}[m
[31m-h4 small,[m
[31m-.h4 small,[m
[31m-h5 small,[m
[31m-.h5 small,[m
[31m-h6 small,[m
[31m-.h6 small,[m
[31m-h4 .small,[m
[31m-.h4 .small,[m
[31m-h5 .small,[m
[31m-.h5 .small,[m
[31m-h6 .small,[m
[31m-.h6 .small {[m
[31m-  font-size: 75%;[m
[31m-}[m
[31m-h1,[m
[31m-.h1 {[m
[31m-  font-size: 36px;[m
[31m-}[m
[31m-h2,[m
[31m-.h2 {[m
[31m-  font-size: 30px;[m
[31m-}[m
[31m-h3,[m
[31m-.h3 {[m
[31m-  font-size: 24px;[m
[31m-}[m
[31m-h4,[m
[31m-.h4 {[m
[31m-  font-size: 18px;[m
[31m-}[m
[31m-h5,[m
[31m-.h5 {[m
[31m-  font-size: 14px;[m
[31m-}[m
[31m-h6,[m
[31m-.h6 {[m
[31m-  font-size: 12px;[m
[31m-}[m
[31m-p {[m
[31m-  margin: 0 0 10px;[m
[31m-}[m
[31m-.lead {[m
[31m-  margin-bottom: 20px;[m
[31m-  font-size: 16px;[m
[31m-  font-weight: 300;[m
[31m-  line-height: 1.4;[m
[31m-}[m
[31m-@media (min-width: 768px) {[m
[31m-  .lead {[m
[31m-    font-size: 21px;[m
[31m-  }[m
[31m-}[m
[31m-small,[m
[31m-.small {[m
[31m-  font-size: 85%;[m
[31m-}[m
[31m-mark,[m
[31m-.mark {[m
[31m-  padding: .2em;[m
[31m-  background-color: #fcf8e3;[m
[31m-}[m
[31m-.text-left {[m
[31m-  text-align: left;[m
[31m-}[m
[31m-.text-right {[m
[31m-  text-align: right;[m
[31m-}[m
[31m-.text-center {[m
[31m-  text-align: center;[m
[31m-}[m
[31m-.text-justify {[m
[31m-  text-align: justify;[m
[31m-}[m
[31m-.text-nowrap {[m
[31m-  white-space: nowrap;[m
[31m-}[m
[31m-.text-lowercase {[m
[31m-  text-transform: lowercase;[m
[31m-}[m
[31m-.text-uppercase {[m
[31m-  text-transform: uppercase;[m
[31m-}[m
[31m-.text-capitalize {[m
[31m-  text-transform: capitalize;[m
[31m-}[m
[31m-.text-muted {[m
[31m-  color: #777;[m
[31m-}[m
[31m-.text-primary {[m
[31m-  color: #337ab7;[m
[31m-}[m
[31m-a.text-primary:hover {[m
[31m-  color: #286090;[m
[31m-}[m
[31m-.text-success {[m
[31m-  color: #3c763d;[m
[31m-}[m
[31m-a.text-success:hover {[m
[31m-  color: #2b542c;[m
[31m-}[m
[31m-.text-info {[m
[31m-  color: #31708f;[m
[31m-}[m
[31m-a.text-info:hover {[m
[31m-  color: #245269;[m
[31m-}[m
[31m-.text-warning {[m
[31m-  color: #8a6d3b;[m
[31m-}[m
[31m-a.text-warning:hover {[m
[31m-  color: #66512c;[m
[31m-}[m
[31m-.text-danger {[m
[31m-  color: #a94442;[m
[31m-}[m
[31m-a.text-danger:hover {[m
[31m-  color: #843534;[m
[31m-}[m
[31m-.bg-primary {[m
[31m-  color: #fff;[m
[31m-  background-color: #337ab7;[m
[31m-}[m
[31m-a.bg-primary:hover {[m
[31m-  background-color: #286090;[m
[31m-}[m
[31m-.bg-success {[m
[31m-  background-color: #dff0d8;[m
[31m-}[m
[31m-a.bg-success:hover {[m
[31m-  background-color: #c1e2b3;[m
[31m-}[m
[31m-.bg-info {[m
[31m-  background-color: #d9edf7;[m
[31m-}[m
[31m-a.bg-info:hover {[m
[31m-  background-color: #afd9ee;[m
[31m-}[m
[31m-.bg-warning {[m
[31m-  background-color: #fcf8e3;[m
[31m-}[m
[31m-a.bg-warning:hover {[m
[31m-  background-color: #f7ecb5;[m
[31m-}[m
[31m-.bg-danger {[m
[31m-  background-color: #f2dede;[m
[31m-}[m
[31m-a.bg-danger:hover {[m
[31m-  background-color: #e4b9b9;[m
[31m-}[m
[31m-.page-header {[m
[31m-  padding-bottom: 9px;[m
[31m-  margin: 40px 0 20px;[m
[31m-  border-bottom: 1px solid #eee;[m
[31m-}[m
[31m-ul,[m
[31m-ol {[m
[31m-  margin-top: 0;[m
[31m-  margin-bottom: 10px;[m
[31m-}[m
[31m-ul ul,[m
[31m-ol ul,[m
[31m-ul ol,[m
[31m-ol ol {[m
[31m-  margin-bottom: 0;[m
[31m-}[m
[31m-.list-unstyled {[m
[31m-  padding-left: 0;[m
[31m-  list-style: none;[m
[31m-}[m
[31m-.list-inline {[m
[31m-  padding-left: 0;[m
[31m-  margin-left: -5px;[m
[31m-  list-style: none;[m
[31m-}[m
[31m-.list-inline > li {[m
[31m-  display: inline-block;[m
[31m-  padding-right: 5px;[m
[31m-  padding-left: 5px;[m
[31m-}[m
[31m-dl {[m
[31m-  margin-top: 0;[m
[31m-  margin-bottom: 20px;[m
[31m-}[m
[31m-dt,[m
[31m-dd {[m
[31m-  line-height: 1.42857143;[m
[31m-}[m
[31m-dt {[m
[31m-  font-weight: bold;[m
[31m-}[m
[31m-dd {[m
[31m-  margin-left: 0;[m
[31m-}[m
[31m-@media (min-width: 768px) {[m
[31m-  .dl-horizontal dt {[m
[31m-    float: left;[m
[31m-    width: 160px;[m
[31m-    overflow: hidden;[m
[31m-    clear: left;[m
[31m-    text-align: right;[m
[31m-    text-overflow: ellipsis;[m
[31m-    white-space: nowrap;[m
[31m-  }[m
[31m-  .dl-horizontal dd {[m
[31m-    margin-left: 180px;[m
[31m-  }[m
[31m-}[m
[31m-abbr[title],[m
[31m-abbr[data-original-title] {[m
[31m-  cursor: help;[m
[31m-  border-bottom: 1px dotted #777;[m
[31m-}[m
[31m-.initialism {[m
[31m-  font-size: 90%;[m
[31m-  text-transform: uppercase;[m
[31m-}[m
[31m-blockquote {[m
[31m-  padding: 10px 20px;[m
[31m-  margin: 0 0 20px;[m
[31m-  font-size: 17.5px;[m
[31m-  border-left: 5px solid #eee;[m
[31m-}[m
[31m-blockquote p:last-child,[m
[31m-blockquote ul:last-child,[m
[31m-blockquote ol:last-child {[m
[31m-  margin-bottom: 0;[m
[31m-}[m
[31m-blockquote footer,[m
[31m-blockquote small,[m
[31m-blockquote .small {[m
[31m-  display: block;[m
[31m-  font-size: 80%;[m
[31m-  line-height: 1.42857143;[m
[31m-  color: #777;[m
[31m-}[m
[31m-blockquote footer:before,[m
[31m-blockquote small:before,[m
[31m-blockquote .small:before {[m
[31m-  content: '\2014 \00A0';[m
[31m-}[m
[31m-.blockquote-reverse,[m
[31m-blockquote.pull-right {[m
[31m-  padding-right: 15px;[m
[31m-  padding-left: 0;[m
[31m-  text-align: right;[m
[31m-  border-right: 5px solid #eee;[m
[31m-  border-left: 0;[m
[31m-}[m
[31m-.blockquote-reverse footer:before,[m
[31m-blockquote.pull-right footer:before,[m
[31m-.blockquote-reverse small:before,[m
[31m-blockquote.pull-right small:before,[m
[31m-.blockquote-reverse .small:before,[m
[31m-blockquote.pull-right .small:before {[m
[31m-  content: '';[m
[31m-}[m
[31m-.blockquote-reverse footer:after,[m
[31m-blockquote.pull-right footer:after,[m
[31m-.blockquote-reverse small:after,[m
[31m-blockquote.pull-right small:after,[m
[31m-.blockquote-reverse .small:after,[m
[31m-blockquote.pull-right .small:after {[m
[31m-  content: '\00A0 \2014';[m
[31m-}[m
[31m-address {[m
[31m-  margin-bottom: 20px;[m
[31m-  font-style: normal;[m
[31m-  line-height: 1.42857143;[m
[31m-}[m
[31m-code,[m
[31m-kbd,[m
[31m-pre,[m
[31m-samp {[m
[31m-  font-family: Menlo, Monaco, Consolas, "Courier New", monospace;[m
[31m-}[m
[31m-code {[m
[31m-  padding: 2px 4px;[m
[31m-  font-size: 90%;[m
[31m-  color: #c7254e;[m
[31m-  background-color: #f9f2f4;[m
[31m-  border-radius: 4px;[m
[31m-}[m
[31m-kbd {[m
[31m-  padding: 2px 4px;[m
[31m-  font-size: 90%;[m
[31m-  color: #fff;[m
[31m-  background-color: #333;[m
[31m-  border-radius: 3px;[m
[31m-  -webkit-box-shadow: inset 0 -1px 0 rgba(0, 0, 0, .25);[m
[31m-          box-shadow: inset 0 -1px 0 rgba(0, 0, 0, .25);[m
[31m-}[m
[31m-kbd kbd {[m
[31m-  padding: 0;[m
[31m-  font-size: 100%;[m
[31m-  font-weight: bold;[m
[31m-  -webkit-box-shadow: none;[m
[31m-          box-shadow: none;[m
[31m-}[m
[31m-pre {[m
[31m-  display: block;[m
[31m-  padding: 9.5px;[m
[31m-  margin: 0 0 10px;[m
[31m-  font-size: 13px;[m
[31m-  line-height: 1.42857143;[m
[31m-  color: #333;[m
[31m-  word-break: break-all;[m
[31m-  word-wrap: break-word;[m
[31m-  background-color: #f5f5f5;[m
[31m-  border: 1px solid #ccc;[m
[31m-  border-radius: 4px;[m
[31m-}[m
[31m-pre code {[m
[31m-  padding: 0;[m
[31m-  font-size: inherit;[m
[31m-  color: inherit;[m
[31m-  white-space: pre-wrap;[m
[31m-  background-color: transparent;[m
[31m-  border-radius: 0;[m
[31m-}[m
[31m-.pre-scrollable {[m
[31m-  max-height: 340px;[m
[31m-  overflow-y: scroll;[m
[31m-}[m
[31m-.container {[m
[31m-  padding-right: 15px;[m
[31m-  padding-left: 15px;[m
[31m-  margin-right: auto;[m
[31m-  margin-left: auto;[m
[31m-}[m
[31m-@media (min-width: 768px) {[m
[31m-  .container {[m
[31m-    width: 750px;[m
[31m-  }[m
[31m-}[m
[31m-@media (min-width: 992px) {[m
[31m-  .container {[m
[31m-    width: 970px;[m
[31m-  }[m
[31m-}[m
[31m-@media (min-width: 1200px) {[m
[31m-  .container {[m
[31m-    width: 1170px;[m
[31m-  }[m
[31m-}[m
[31m-.container-fluid {[m
[31m-  padding-right: 15px;[m
[31m-  padding-left: 15px;[m
[31m-  margin-right: auto;[m
[31m-  margin-left: auto;[m
[31m-}[m
[31m-.row {[m
[31m-  margin-right: -15px;[m
[31m-  margin-left: -15px;[m
[31m-}[m
[31m-.col-xs-1, .col-sm-1, .col-md-1, .col-lg-1, .col-xs-2, .col-sm-2, .col-md-2, .col-lg-2, .col-xs-3, .col-sm-3, .col-md-3, .col-lg-3, .col-xs-4, .col-sm-4, .col-md-4, .col-lg-4, .col-xs-5, .col-sm-5, .col-md-5, .col-lg-5, .col-xs-6, .col-sm-6, .col-md-6, .col-lg-6, .col-xs-7, .col-sm-7, .col-md-7, .col-lg-7, .col-xs-8, .col-sm-8, .col-md-8, .col-lg-8, .col-xs-9, .col-sm-9, .col-md-9, .col-lg-9, .col-xs-10, .col-sm-10, .col-md-10, .col-lg-10, .col-xs-11, .col-sm-11, .col-md-11, .col-lg-11, .col-xs-12, .col-sm-12, .col-md-12, .col-lg-12 {[m
[31m-  position: relative;[m
[31m-  min-height: 1px;[m
[31m-  padding-right: 15px;[m
[31m-  padding-left: 15px;[m
[31m-}[m
[31m-.col-xs-1, .col-xs-2, .col-xs-3, .col-xs-4, .col-xs-5, .col-xs-6, .col-xs-7, .col-xs-8, .col-xs-9, .col-xs-10, .col-xs-11, .col-xs-12 {[m
[31m-  float: left;[m
[31m-}[m
[31m-.col-xs-12 {[m
[31m-  width: 100%;[m
[31m-}[m
[31m-.col-xs-11 {[m
[31m-  width: 91.66666667%;[m
[31m-}[m
[31m-.col-xs-10 {[m
[31m-  width: 83.33333333%;[m
[31m-}[m
[31m-.col-xs-9 {[m
[31m-  width: 75%;[m
[31m-}[m
[31m-.col-xs-8 {[m
[31m-  width: 66.66666667%;[m
[31m-}[m
[31m-.col-xs-7 {[m
[31m-  width: 58.33333333%;[m
[31m-}[m
[31m-.col-xs-6 {[m
[31m-  width: 50%;[m
[31m-}[m
[31m-.col-xs-5 {[m
[31m-  width: 41.66666667%;[m
[31m-}[m
[31m-.col-xs-4 {[m
[31m-  width: 33.33333333%;[m
[31m-}[m
[31m-.col-xs-3 {[m
[31m-  width: 25%;[m
[31m-}[m
[31m-.col-xs-2 {[m
[31m-  width: 16.66666667%;[m
[31m-}[m
[31m-.col-xs-1 {[m
[31m-  width: 8.33333333%;[m
[31m-}[m
[31m-.col-xs-pull-12 {[m
[31m-  right: 100%;[m
[31m-}[m
[31m-.col-xs-pull-11 {[m
[31m-  right: 91.66666667%;[m
[31m-}[m
[31m-.col-xs-pull-10 {[m
[31m-  right: 83.33333333%;[m
[31m-}[m
[31m-.col-xs-pull-9 {[m
[31m-  right: 75%;[m
[31m-}[m
[31m-.col-xs-pull-8 {[m
[31m-  right: 66.66666667%;[m
[31m-}[m
[31m-.col-xs-pull-7 {[m
[31m-  right: 58.33333333%;[m
[31m-}[m
[31m-.col-xs-pull-6 {[m
[31m-  right: 50%;[m
[31m-}[m
[31m-.col-xs-pull-5 {[m
[31m-  right: 41.66666667%;[m
[31m-}[m
[31m-.col-xs-pull-4 {[m
[31m-  right: 33.33333333%;[m
[31m-}[m
[31m-.col-xs-pull-3 {[m
[31m-  right: 25%;[m
[31m-}[m
[31m-.col-xs-pull-2 {[m
[31m-  right: 16.66666667%;[m
[31m-}[m
[31m-.col-xs-pull-1 {[m
[31m-  right: 8.33333333%;[m
[31m-}[m
[31m-.col-xs-pull-0 {[m
[31m-  right: auto;[m
[31m-}[m
[31m-.col-xs-push-12 {[m
[31m-  left: 100%;[m
[31m-}[m
[31m-.col-xs-push-11 {[m
[31m-  left: 91.66666667%;[m
[31m-}[m
[31m-.col-xs-push-10 {[m
[31m-  left: 83.33333333%;[m
[31m-}[m
[31m-.col-xs-push-9 {[m
[31m-  left: 75%;[m
[31m-}[m
[31m-.col-xs-push-8 {[m
[31m-  left: 66.66666667%;[m
[31m-}[m
[31m-.col-xs-push-7 {[m
[31m-  left: 58.33333333%;[m
[31m-}[m
[31m-.col-xs-push-6 {[m
[31m-  left: 50%;[m
[31m-}[m
[31m-.col-xs-push-5 {[m
[31m-  left: 41.66666667%;[m
[31m-}[m
[31m-.col-xs-push-4 {[m
[31m-  left: 33.33333333%;[m
[31m-}[m
[31m-.col-xs-push-3 {[m
[31m-  left: 25%;[m
[31m-}[m
[31m-.col-xs-push-2 {[m
[31m-  left: 16.66666667%;[m
[31m-}[m
[31m-.col-xs-push-1 {[m
[31m-  left: 8.33333333%;[m
[31m-}[m
[31m-.col-xs-push-0 {[m
[31m-  left: auto;[m
[31m-}[m
[31m-.col-xs-offset-12 {[m
[31m-  margin-left: 100%;[m
[31m-}[m
[31m-.col-xs-offset-11 {[m
[31m-  margin-left: 91.66666667%;[m
[31m-}[m
[31m-.col-xs-offset-10 {[m
[31m-  margin-left: 83.33333333%;[m
[31m-}[m
[31m-.col-xs-offset-9 {[m
[31m-  margin-left: 75%;[m
[31m-}[m
[31m-.col-xs-offset-8 {[m
[31m-  margin-left: 66.66666667%;[m
[31m-}[m
[31m-.col-xs-offset-7 {[m
[31m-  margin-left: 58.33333333%;[m
[31m-}[m
[31m-.col-xs-offset-6 {[m
[31m-  margin-left: 50%;[m
[31m-}[m
[31m-.col-xs-offset-5 {[m
[31m-  margin-left: 41.66666667%;[m
[31m-}[m
[31m-.col-xs-offset-4 {[m
[31m-  margin-left: 33.33333333%;[m
[31m-}[m
[31m-.col-xs-offset-3 {[m
[31m-  margin-left: 25%;[m
[31m-}[m
[31m-.col-xs-offset-2 {[m
[31m-  margin-left: 16.66666667%;[m
[31m-}[m
[31m-.col-xs-offset-1 {[m
[31m-  margin-left: 8.33333333%;[m
[31m-}[m
[31m-.col-xs-offset-0 {[m
[31m-  margin-left: 0;[m
[31m-}[m
[31m-@media (min-width: 768px) {[m
[31m-  .col-sm-1, .col-sm-2, .col-sm-3, .col-sm-4, .col-sm-5, .col-sm-6, .col-sm-7, .col-sm-8, .col-sm-9, .col-sm-10, .col-sm-11, .col-sm-12 {[m
[31m-    float: left;[m
[31m-  }[m
[31m-  .col-sm-12 {[m
[31m-    width: 100%;[m
[31m-  }[m
[31m-  .col-sm-11 {[m
[31m-    width: 91.66666667%;[m
[31m-  }[m
[31m-  .col-sm-10 {[m
[31m-    width: 83.33333333%;[m
[31m-  }[m
[31m-  .col-sm-9 {[m
[31m-    width: 75%;[m
[31m-  }[m
[31m-  .col-sm-8 {[m
[31m-    width: 66.66666667%;[m
[31m-  }[m
[31m-  .col-sm-7 {[m
[31m-    width: 58.33333333%;[m
[31m-  }[m
[31m-  .col-sm-6 {[m
[31m-    width: 50%;[m
[31m-  }[m
[31m-  .col-sm-5 {[m
[31m-    width: 41.66666667%;[m
[31m-  }[m
[31m-  .col-sm-4 {[m
[31m-    width: 33.33333333%;[m
[31m-  }[m
[31m-  .col-sm-3 {[m
[31m-    width: 25%;[m
[31m-  }[m
[31m-  .col-sm-2 {[m
[31m-    width: 16.66666667%;[m
[31m-  }[m
[31m-  .col-sm-1 {[m
[31m-    width: 8.33333333%;[m
[31m-  }[m
[31m-  .col-sm-pull-12 {[m
[31m-    right: 100%;[m
[31m-  }[m
[31m-  .col-sm-pull-11 {[m
[31m-    right: 91.66666667%;[m
[31m-  }[m
[31m-  .col-sm-pull-10 {[m
[31m-    right: 83.33333333%;[m
[31m-  }[m
[31m-  .col-sm-pull-9 {[m
[31m-    right: 75%;[m
[31m-  }[m
[31m-  .col-sm-pull-8 {[m
[31m-    right: 66.66666667%;[m
[31m-  }[m
[31m-  .col-sm-pull-7 {[m
[31m-    right: 58.33333333%;[m
[31m-  }[m
[31m-  .col-sm-pull-6 {[m
[31m-    right: 50%;[m
[31m-  }[m
[31m-  .col-sm-pull-5 {[m
[31m-    right: 41.66666667%;[m
[31m-  }[m
[31m-  .col-sm-pull-4 {[m
[31m-    right: 33.33333333%;[m
[31m-  }[m
[31m-  .col-sm-pull-3 {[m
[31m-    right: 25%;[m
[31m-  }[m
[31m-  .col-sm-pull-2 {[m
[31m-    right: 16.66666667%;[m
[31m-  }[m
[31m-  .col-sm-pull-1 {[m
[31m-    right: 8.33333333%;[m
[31m-  }[m
[31m-  .col-sm-pull-0 {[m
[31m-    right: auto;[m
[31m-  }[m
[31m-  .col-sm-push-12 {[m
[31m-    left: 100%;[m
[31m-  }[m
[31m-  .col-sm-push-11 {[m
[31m-    left: 91.66666667%;[m
[31m-  }[m
[31m-  .col-sm-push-10 {[m
[31m-    left: 83.33333333%;[m
[31m-  }[m
[31m-  .col-sm-push-9 {[m
[31m-    left: 75%;[m
[31m-  }[m
[31m-  .col-sm-push-8 {[m
[31m-    left: 66.66666667%;[m
[31m-  }[m
[31m-  .col-sm-push-7 {[m
[31m-    left: 58.33333333%;[m
[31m-  }[m
[31m-  .col-sm-push-6 {[m
[31m-    left: 50%;[m
[31m-  }[m
[31m-  .col-sm-push-5 {[m
[31m-    left: 41.66666667%;[m
[31m-  }[m
[31m-  .col-sm-push-4 {[m
[31m-    left: 33.33333333%;[m
[31m-  }[m
[31m-  .col-sm-push-3 {[m
[31m-    left: 25%;[m
[31m-  }[m
[31m-  .col-sm-push-2 {[m
[31m-    left: 16.66666667%;[m
[31m-  }[m
[31m-  .col-sm-push-1 {[m
[31m-    left: 8.33333333%;[m
[31m-  }[m
[31m-  .col-sm-push-0 {[m
[31m-    left: auto;[m
[31m-  }[m
[31m-  .col-sm-offset-12 {[m
[31m-    margin-left: 100%;[m
[31m-  }[m
[31m-  .col-sm-offset-11 {[m
[31m-    margin-left: 91.66666667%;[m
[31m-  }[m
[31m-  .col-sm-offset-10 {[m
[31m-    margin-left: 83.33333333%;[m
[31m-  }[m
[31m-  .col-sm-offset-9 {[m
[31m-    margin-left: 75%;[m
[31m-  }[m
[31m-  .col-sm-offset-8 {[m
[31m-    margin-left: 66.66666667%;[m
[31m-  }[m
[31m-  .col-sm-offset-7 {[m
[31m-    margin-left: 58.33333333%;[m
[31m-  }[m
[31m-  .col-sm-offset-6 {[m
[31m-    margin-left: 50%;[m
[31m-  }[m
[31m-  .col-sm-offset-5 {[m
[31m-    margin-left: 41.66666667%;[m
[31m-  }[m
[31m-  .col-sm-offset-4 {[m
[31m-    margin-left: 33.33333333%;[m
[31m-  }[m
[31m-  .col-sm-offset-3 {[m
[31m-    margin-left: 25%;[m
[31m-  }[m
[31m-  .col-sm-offset-2 {[m
[31m-    margin-left: 16.66666667%;[m
[31m-  }[m
[31m-  .col-sm-offset-1 {[m
[31m-    margin-left: 8.33333333%;[m
[31m-  }[m
[31m-  .col-sm-offset-0 {[m
[31m-    margin-left: 0;[m
[31m-  }[m
[31m-}[m
[31m-@media (min-width: 992px) {[m
[31m-  .col-md-1, .col-md-2, .col-md-3, .col-md-4, .col-md-5, .col-md-6, .col-md-7, .col-md-8, .col-md-9, .col-md-10, .col-md-11, .col-md-12 {[m
[31m-    float: left;[m
[31m-  }[m
[31m-  .col-md-12 {[m
[31m-    width: 100%;[m
[31m-  }[m
[31m-  .col-md-11 {[m
[31m-    width: 91.66666667%;[m
[31m-  }[m
[31m-  .col-md-10 {[m
[31m-    width: 83.33333333%;[m
[31m-  }[m
[31m-  .col-md-9 {[m
[31m-    width: 75%;[m
[31m-  }[m
[31m-  .col-md-8 {[m
[31m-    width: 66.66666667%;[m
[31m-  }[m
[31m-  .col-md-7 {[m
[31m-    width: 58.33333333%;[m
[31m-  }[m
[31m-  .col-md-6 {[m
[31m-    width: 50%;[m
[31m-  }[m
[31m-  .col-md-5 {[m
[31m-    width: 41.66666667%;[m
[31m-  }[m
[31m-  .col-md-4 {[m
[31m-    width: 33.33333333%;[m
[31m-  }[m
[31m-  .col-md-3 {[m
[31m-    width: 25%;[m
[31m-  }[m
[31m-  .col-md-2 {[m
[31m-    width: 16.66666667%;[m
[31m-  }[m
[31m-  .col-md-1 {[m
[31m-    width: 8.33333333%;[m
[31m-  }[m
[31m-  .col-md-pull-12 {[m
[31m-    right: 100%;[m
[31m-  }[m
[31m-  .col-md-pull-11 {[m
[31m-    right: 91.66666667%;[m
[31m-  }[m
[31m-  .col-md-pull-10 {[m
[31m-    right: 83.33333333%;[m
[31m-  }[m
[31m-  .col-md-pull-9 {[m
[31m-    right: 75%;[m
[31m-  }[m
[31m-  .col-md-pull-8 {[m
[31m-    right: 66.66666667%;[m
[31m-  }[m
[31m-  .col-md-pull-7 {[m
[31m-    right: 58.33333333%;[m
[31m-  }[m
[31m-  .col-md-pull-6 {[m
[31m-    right: 50%;[m
[31m-  }[m
[31m-  .col-md-pull-5 {[m
[31m-    right: 41.66666667%;[m
[31m-  }[m
[31m-  .col-md-pull-4 {[m
[31m-    right: 33.33333333%;[m
[31m-  }[m
[31m-  .col-md-pull-3 {[m
[31m-    right: 25%;[m
[31m-  }[m
[31m-  .col-md-pull-2 {[m
[31m-    right: 16.66666667%;[m
[31m-  }[m
[31m-  .col-md-pull-1 {[m
[31m-    right: 8.33333333%;[m
[31m-  }[m
[31m-  .col-md-pull-0 {[m
[31m-    right: auto;[m
[31m-  }[m
[31m-  .col-md-push-12 {[m
[31m-    left: 100%;[m
[31m-  }[m
[31m-  .col-md-push-11 {[m
[31m-    left: 91.66666667%;[m
[31m-  }[m
[31m-  .col-md-push-10 {[m
[31m-    left: 83.33333333%;[m
[31m-  }[m
[31m-  .col-md-push-9 {[m
[31m-    left: 75%;[m
[31m-  }[m
[31m-  .col-md-push-8 {[m
[31m-    left: 66.66666667%;[m
[31m-  }[m
[31m-  .col-md-push-7 {[m
[31m-    left: 58.33333333%;[m
[31m-  }[m
[31m-  .col-md-push-6 {[m
[31m-    left: 50%;[m
[31m-  }[m
[31m-  .col-md-push-5 {[m
[31m-    left: 41.66666667%;[m
[31m-  }[m
[31m-  .col-md-push-4 {[m
[31m-    left: 33.33333333%;[m
[31m-  }[m
[31m-  .col-md-push-3 {[m
[31m-    left: 25%;[m
[31m-  }[m
[31m-  .col-md-push-2 {[m
[31m-    left: 16.66666667%;[m
[31m-  }[m
[31m-  .col-md-push-1 {[m
[31m-    left: 8.33333333%;[m
[31m-  }[m
[31m-  .col-md-push-0 {[m
[31m-    left: auto;[m
[31m-  }[m
[31m-  .col-md-offset-12 {[m
[31m-    margin-left: 100%;[m
[31m-  }[m
[31m-  .col-md-offset-11 {[m
[31m-    margin-left: 91.66666667%;[m
[31m-  }[m
[31m-  .col-md-offset-10 {[m
[31m-    margin-left: 83.33333333%;[m
[31m-  }[m
[31m-  .col-md-offset-9 {[m
[31m-    margin-left: 75%;[m
[31m-  }[m
[31m-  .col-md-offset-8 {[m
[31m-    margin-left: 66.66666667%;[m
[31m-  }[m
[31m-  .col-md-offset-7 {[m
[31m-    margin-left: 58.33333333%;[m
[31m-  }[m
[31m-  .col-md-offset-6 {[m
[31m-    margin-left: 50%;[m
[31m-  }[m
[31m-  .col-md-offset-5 {[m
[31m-    margin-left: 41.66666667%;[m
[31m-  }[m
[31m-  .col-md-offset-4 {[m
[31m-    margin-left: 33.33333333%;[m
[31m-  }[m
[31m-  .col-md-offset-3 {[m
[31m-    margin-left: 25%;[m
[31m-  }[m
[31m-  .col-md-offset-2 {[m
[31m-    margin-left: 16.66666667%;[m
[31m-  }[m
[31m-  .col-md-offset-1 {[m
[31m-    margin-left: 8.33333333%;[m
[31m-  }[m
[31m-  .col-md-offset-0 {[m
[31m-    margin-left: 0;[m
[31m-  }[m
[31m-}[m
[31m-@media (min-width: 1200px) {[m
[31m-  .col-lg-1, .col-lg-2, .col-lg-3, .col-lg-4, .col-lg-5, .col-lg-6, .col-lg-7, .col-lg-8, .col-lg-9, .col-lg-10, .col-lg-11, .col-lg-12 {[m
[31m-    float: left;[m
[31m-  }[m
[31m-  .col-lg-12 {[m
[31m-    width: 100%;[m
[31m-  }[m
[31m-  .col-lg-11 {[m
[31m-    width: 91.66666667%;[m
[31m-  }[m
[31m-  .col-lg-10 {[m
[31m-    width: 83.33333333%;[m
[31m-  }[m
[31m-  .col-lg-9 {[m
[31m-    width: 75%;[m
[31m-  }[m
[31m-  .col-lg-8 {[m
[31m-    width: 66.66666667%;[m
[31m-  }[m
[31m-  .col-lg-7 {[m
[31m-    width: 58.33333333%;[m
[31m-  }[m
[31m-  .col-lg-6 {[m
[31m-    width: 50%;[m
[31m-  }[m
[31m-  .col-lg-5 {[m
[31m-    width: 41.66666667%;[m
[31m-  }[m
[31m-  .col-lg-4 {[m
[31m-    width: 33.33333333%;[m
[31m-  }[m
[31m-  .col-lg-3 {[m
[31m-    width: 25%;[m
[31m-  }[m
[31m-  .col-lg-2 {[m
[31m-    width: 16.66666667%;[m
[31m-  }[m
[31m-  .col-lg-1 {[m
[31m-    width: 8.33333333%;[m
[31m-  }[m
[31m-  .col-lg-pull-12 {[m
[31m-    right: 100%;[m
[31m-  }[m
[31m-  .col-lg-pull-11 {[m
[31m-    right: 91.66666667%;[m
[31m-  }[m
[31m-  .col-lg-pull-10 {[m
[31m-    right: 83.33333333%;[m
[31m-  }[m
[31m-  .col-lg-pull-9 {[m
[31m-    right: 75%;[m
[31m-  }[m
[31m-  .col-lg-pull-8 {[m
[31m-    right: 66.66666667%;[m
[31m-  }[m
[31m-  .col-lg-pull-7 {[m
[31m-    right: 58.33333333%;[m
[31m-  }[m
[31m-  .col-lg-pull-6 {[m
[31m-    right: 50%;[m
[31m-  }[m
[31m-  .col-lg-pull-5 {[m
[31m-    right: 41.66666667%;[m
[31m-  }[m
[31m-  .col-lg-pull-4 {[m
[31m-    right: 33.33333333%;[m
[31m-  }[m
[31m-  .col-lg-pull-3 {[m
[31m-    right: 25%;[m
[31m-  }[m
[31m-  .col-lg-pull-2 {[m
[31m-    right: 16.66666667%;[m
[31m-  }[m
[31m-  .col-lg-pull-1 {[m
[31m-    right: 8.33333333%;[m
[31m-  }[m
[31m-  .col-lg-pull-0 {[m
[31m-    right: auto;[m
[31m-  }[m
[31m-  .col-lg-push-12 {[m
[31m-    left: 100%;[m
[31m-  }[m
[31m-  .col-lg-push-11 {[m
[31m-    left: 91.66666667%;[m
[31m-  }[m
[31m-  .col-lg-push-10 {[m
[31m-    left: 83.33333333%;[m
[31m-  }[m
[31m-  .col-lg-push-9 {[m
[31m-    left: 75%;[m
[31m-  }[m
[31m-  .col-lg-push-8 {[m
[31m-    left: 66.66666667%;[m
[31m-  }[m
[31m-  .col-lg-push-7 {[m
[31m-    left: 58.33333333%;[m
[31m-  }[m
[31m-  .col-lg-push-6 {[m
[31m-    left: 50%;[m
[31m-  }[m
[31m-  .col-lg-push-5 {[m
[31m-    left: 41.66666667%;[m
[31m-  }[m
[31m-  .col-lg-push-4 {[m
[31m-    left: 33.33333333%;[m
[31m-  }[m
[31m-  .col-lg-push-3 {[m
[31m-    left: 25%;[m
[31m-  }[m
[31m-  .col-lg-push-2 {[m
[31m-    left: 16.66666667%;[m
[31m-  }[m
[31m-  .col-lg-push-1 {[m
[31m-    left: 8.33333333%;[m
[31m-  }[m
[31m-  .col-lg-push-0 {[m
[31m-    left: auto;[m
[31m-  }[m
[31m-  .col-lg-offset-12 {[m
[31m-    margin-left: 100%;[m
[31m-  }[m
[31m-  .col-lg-offset-11 {[m
[31m-    margin-left: 91.66666667%;[m
[31m-  }[m
[31m-  .col-lg-offset-10 {[m
[31m-    margin-left: 83.33333333%;[m
[31m-  }[m
[31m-  .col-lg-offset-9 {[m
[31m-    margin-left: 75%;[m
[31m-  }[m
[31m-  .col-lg-offset-8 {[m
[31m-    margin-left: 66.66666667%;[m
[31m-  }[m
[31m-  .col-lg-offset-7 {[m
[31m-    margin-left: 58.33333333%;[m
[31m-  }[m
[31m-  .col-lg-offset-6 {[m
[31m-    margin-left: 50%;[m
[31m-  }[m
[31m-  .col-lg-offset-5 {[m
[31m-    margin-left: 41.66666667%;[m
[31m-  }[m
[31m-  .col-lg-offset-4 {[m
[31m-    margin-left: 33.33333333%;[m
[31m-  }[m
[31m-  .col-lg-offset-3 {[m
[31m-    margin-left: 25%;[m
[31m-  }[m
[31m-  .col-lg-offset-2 {[m
[31m-    margin-left: 16.66666667%;[m
[31m-  }[m
[31m-  .col-lg-offset-1 {[m
[31m-    margin-left: 8.33333333%;[m
[31m-  }[m
[31m-  .col-lg-offset-0 {[m
[31m-    margin-left: 0;[m
[31m-  }[m
[31m-}[m
[31m-table {[m
[31m-  background-color: transparent;[m
[31m-}[m
[31m-caption {[m
[31m-  padding-top: 8px;[m
[31m-  padding-bottom: 8px;[m
[31m-  color: #777;[m
[31m-  text-align: left;[m
[31m-}[m
[31m-th {[m
[31m-  text-align: left;[m
[31m-}[m
[31m-.table {[m
[31m-  width: 100%;[m
[31m-  max-width: 100%;[m
[31m-  margin-bottom: 20px;[m
[31m-}[m
[31m-.table > thead > tr > th,[m
[31m-.table > tbody > tr > th,[m
[31m-.table > tfoot > tr > th,[m
[31m-.table > thead > tr > td,[m
[31m-.table > tbody > tr > td,[m
[31m-.table > tfoot > tr > td {[m
[31m-  padding: 8px;[m
[31m-  line-height: 1.42857143;[m
[31m-  vertical-align: top;[m
[31m-  border-top: 1px solid #ddd;[m
[31m-}[m
[31m-.table > thead > tr > th {[m
[31m-  vertical-align: bottom;[m
[31m-  border-bottom: 2px solid #ddd;[m
[31m-}[m
[31m-.table > caption + thead > tr:first-child > th,[m
[31m-.table > colgroup + thead > tr:first-child > th,[m
[31m-.table > thead:first-child > tr:first-child > th,[m
[31m-.table > caption + thead > tr:first-child > td,[m
[31m-.table > colgroup + thead > tr:first-child > td,[m
[31m-.table > thead:first-child > tr:first-child > td {[m
[31m-  border-top: 0;[m
[31m-}[m
[31m-.table > tbody + tbody {[m
[31m-  border-top: 2px solid #ddd;[m
[31m-}[m
[31m-.table .table {[m
[31m-  background-color: #fff;[m
[31m-}[m
[31m-.table-condensed > thead > tr > th,[m
[31m-.table-condensed > tbody > tr > th,[m
[31m-.table-condensed > tfoot > tr > th,[m
[31m-.table-condensed > thead > tr > td,[m
[31m-.table-condensed > tbody > tr > td,[m
[31m-.table-condensed > tfoot > tr > td {[m
[31m-  padding: 5px;[m
[31m-}[m
[31m-.table-bordered {[m
[31m-  border: 1px solid #ddd;[m
[31m-}[m
[31m-.table-bordered > thead > tr > th,[m
[31m-.table-bordered > tbody > tr > th,[m
[31m-.table-bordered > tfoot > tr > th,[m
[31m-.table-bordered > thead > tr > td,[m
[31m-.table-bordered > tbody > tr > td,[m
[31m-.table-bordered > tfoot > tr > td {[m
[31m-  border: 1px solid #ddd;[m
[31m-}[m
[31m-.table-bordered > thead > tr > th,[m
[31m-.table-bordered > thead > tr > td {[m
[31m-  border-bottom-width: 2px;[m
[31m-}[m
[31m-.table-striped > tbody > tr:nth-of-type(odd) {[m
[31m-  background-color: #f9f9f9;[m
[31m-}[m
[31m-.table-hover > tbody > tr:hover {[m
[31m-  background-color: #f5f5f5;[m
[31m-}[m
[31m-table col[class*="col-"] {[m
[31m-  position: static;[m
[31m-  display: table-column;[m
[31m-  float: none;[m
[31m-}[m
[31m-table td[class*="col-"],[m
[31m-table th[class*="col-"] {[m
[31m-  position: static;[m
[31m-  display: table-cell;[m
[31m-  float: none;[m
[31m-}[m
[31m-.table > thead > tr > td.active,[m
[31m-.table > tbody > tr > td.active,[m
[31m-.table > tfoot > tr > td.active,[m
[31m-.table > thead > tr > th.active,[m
[31m-.table > tbody > tr > th.active,[m
[31m-.table > tfoot > tr > th.active,[m
[31m-.table > thead > tr.active > td,[m
[31m-.table > tbody > tr.active > td,[m
[31m-.table > tfoot > tr.active > td,[m
[31m-.table > thead > tr.active > th,[m
[31m-.table > tbody > tr.active > th,[m
[31m-.table > tfoot > tr.active > th {[m
[31m-  background-color: #f5f5f5;[m
[31m-}[m
[31m-.table-hover > tbody > tr > td.active:hover,[m
[31m-.table-hover > tbody > tr > th.active:hover,[m
[31m-.table-hover > tbody > tr.active:hover > td,[m
[31m-.table-hover > tbody > tr:hover > .active,[m
[31m-.table-hover > tbody > tr.active:hover > th {[m
[31m-  background-color: #e8e8e8;[m
[31m-}[m
[31m-.table > thead > tr > td.success,[m
[31m-.table > tbody > tr > td.success,[m
[31m-.table > tfoot > tr > td.success,[m
[31m-.table > thead > tr > th.success,[m
[31m-.table > tbody > tr > th.success,[m
[31m-.table > tfoot > tr > th.success,[m
[31m-.table > thead > tr.success > td,[m
[31m-.table > tbody > tr.success > td,[m
[31m-.table > tfoot > tr.success > td,[m
[31m-.table > thead > tr.success > th,[m
[31m-.table > tbody > tr.success > th,[m
[31m-.table > tfoot > tr.success > th {[m
[31m-  background-color: #dff0d8;[m
[31m-}[m
[31m-.table-hover > tbody > tr > td.success:hover,[m
[31m-.table-hover > tbody > tr > th.success:hover,[m
[31m-.table-hover > tbody > tr.success:hover > td,[m
[31m-.table-hover > tbody > tr:hover > .success,[m
[31m-.table-hover > tbody > tr.success:hover > th {[m
[31m-  background-color: #d0e9c6;[m
[31m-}[m
[31m-.table > thead > tr > td.info,[m
[31m-.table > tbody > tr > td.info,[m
[31m-.table > tfoot > tr > td.info,[m
[31m-.table > thead > tr > th.info,[m
[31m-.table > tbody > tr > th.info,[m
[31m-.table > tfoot > tr > th.info,[m
[31m-.table > thead > tr.info > td,[m
[31m-.table > tbody > tr.info > td,[m
[31m-.table > tfoot > tr.info > td,[m
[31m-.table > thead > tr.info > th,[m
[31m-.table > tbody > tr.info > th,[m
[31m-.table > tfoot > tr.info > th {[m
[31m-  background-color: #d9edf7;[m
[31m-}[m
[31m-.table-hover > tbody > tr > td.info:hover,[m
[31m-.table-hover > tbody > tr > th.info:hover,[m
[31m-.table-hover > tbody > tr.info:hover > td,[m
[31m-.table-hover > tbody > tr:hover > .info,[m
[31m-.table-hover > tbody > tr.info:hover > th {[m
[31m-  background-color: #c4e3f3;[m
[31m-}[m
[31m-.table > thead > tr > td.warning,[m
[31m-.table > tbody > tr > td.warning,[m
[31m-.table > tfoot > tr > td.warning,[m
[31m-.table > thead > tr > th.warning,[m
[31m-.table > tbody > tr > th.warning,[m
[31m-.table > tfoot > tr > th.warning,[m
[31m-.table > thead > tr.warning > td,[m
[31m-.table > tbody > tr.warning > td,[m
[31m-.table > tfoot > tr.warning > td,[m
[31m-.table > thead > tr.warning > th,[m
[31m-.table > tbody > tr.warning > th,[m
[31m-.table > tfoot > tr.warning > th {[m
[31m-  background-color: #fcf8e3;[m
[31m-}[m
[31m-.table-hover > tbody > tr > td.warning:hover,[m
[31m-.table-hover > tbody > tr > th.warning:hover,[m
[31m-.table-hover > tbody > tr.warning:hover > td,[m
[31m-.table-hover > tbody > tr:hover > .warning,[m
[31m-.table-hover > tbody > tr.warning:hover > th {[m
[31m-  background-color: #faf2cc;[m
[31m-}[m
[31m-.table > thead > tr > td.danger,[m
[31m-.table > tbody > tr > td.danger,[m
[31m-.table > tfoot > tr > td.danger,[m
[31m-.table > thead > tr > th.danger,[m
[31m-.table > tbody > tr > th.danger,[m
[31m-.table > tfoot > tr > th.danger,[m
[31m-.table > thead > tr.danger > td,[m
[31m-.table > tbody > tr.danger > td,[m
[31m-.table > tfoot > tr.danger > td,[m
[31m-.table > thead > tr.danger > th,[m
[31m-.table > tbody > tr.danger > th,[m
[31m-.table > tfoot > tr.danger > th {[m
[31m-  background-color: #f2dede;[m
[31m-}[m
[31m-.table-hover > tbody > tr > td.danger:hover,[m
[31m-.table-hover > tbody > tr > th.danger:hover,[m
[31m-.table-hover > tbody > tr.danger:hover > td,[m
[31m-.table-hover > tbody > tr:hover > .danger,[m
[31m-.table-hover > tbody > tr.danger:hover > th {[m
[31m-  background-color: #ebcccc;[m
[31m-}[m
[31m-.table-responsive {[m
[31m-  min-height: .01%;[m
[31m-  overflow-x: auto;[m
[31m-}[m
[31m-@media screen and (max-width: 767px) {[m
[31m-  .table-responsive {[m
[31m-    width: 100%;[m
[31m-    margin-bottom: 15px;[m
[31m-    overflow-y: hidden;[m
[31m-    -ms-overflow-style: -ms-autohiding-scrollbar;[m
[31m-    border: 1px solid #ddd;[m
[31m-  }[m
[31m-  .table-responsive > .table {[m
[31m-    margin-bottom: 0;[m
[31m-  }[m
[31m-  .table-responsive > .table > thead > tr > th,[m
[31m-  .table-responsive > .table > tbody > tr > th,[m
[31m-  .table-responsive > .table > tfoot > tr > th,[m
[31m-  .table-responsive > .table > thead > tr > td,[m
[31m-  .table-responsive > .table > tbody > tr > td,[m
[31m-  .table-responsive > .table > tfoot > tr > td {[m
[31m-    white-space: nowrap;[m
[31m-  }[m
[31m-  .table-responsive > .table-bordered {[m
[31m-    border: 0;[m
[31m-  }[m
[31m-  .table-responsive > .table-bordered > thead > tr > th:first-child,[m
[31m-  .table-responsive > .table-bordered > tbody > tr > th:first-child,[m
[31m-  .table-responsive > .table-bordered > tfoot > tr > th:first-child,[m
[31m-  .table-responsive > .table-bordered > thead > tr > td:first-child,[m
[31m-  .table-responsive > .table-bordered > tbody > tr > td:first-child,[m
[31m-  .table-responsive > .table-bordered > tfoot > tr > td:first-child {[m
[31m-    border-left: 0;[m
[31m-  }[m
[31m-  .table-responsive > .table-bordered > thead > tr > th:last-child,[m
[31m-  .table-responsive > .table-bordered > tbody > tr > th:last-child,[m
[31m-  .table-responsive > .table-bordered > tfoot > tr > th:last-child,[m
[31m-  .table-responsive > .table-bordered > thead > tr > td:last-child,[m
[31m-  .table-responsive > .table-bordered > tbody > tr