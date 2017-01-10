---
title: Why jekyll rocks!
layout: default
---

### Some reasons why Jekyll is great

- markdown!
- html pass-through
- code syntax highlighting
- liquid templating
- html, css, javascript, json, yaml etc
- git/Github for versioning and hosting
- Github provided CDN
- static content already optimised for seo
- custom dns using cname redirect
- support tags, categories and list filtering
- content and presentation can be separated with gitsubmodules
- for multiuser content blog - git/Github permissions management of roles, groups
- multiple sites per github account using project pages and cnames
- no other hosting, db, webserver, ssl termination, firewall, backup, automation needed
- no cron copy job

### refs

- Submodules and clean separation between structure and content
  - posts git submodule example <https://github.com/thebearjew/thebearjew.github.io>
  - post <http://jry.io/posts/make-your-jekyll-blog-awesome-with-git-submodules/>

- Nice Tutorial and Intro
  <http://joshualande.com/jekyll-github-pages-poole/>

- Github pages jekyll plugins list
  <https://pages.github.com/versions/>

- Multiple sites under one Github account
  <http://webapps.stackexchange.com/questions/42455/publishing-more-than-one-site-on-github-pages>

- Project structure - local and Gihub
  <http://jekyllrb.com/docs/github-pages/#project-page-url-structure>

- Templates
  <http://jekyllrb.com/docs/templates>

- Jekyl config.yml
  <https://help.github.com/articles/configuring-jekyll/>

- Adding Google comments will improve seo
  <http://steelx.github.io/best-internet-tips/2014/11/23/Add-google-plus-comments-box-to-jekyll-website.html>

- dns apex on route53 is a bit limited
  <http://stackoverflow.com/questions/16022324/how-to-setup-dns-for-an-apex-domain-no-www-pointing-to-a-heroku-app>

- <https://forums.aws.amazon.com/thread.jspa?threadID=151954>

- Also seems as though cannot do double cname to github, but could probably use this, redirector
  or else set up an instance to do 301 http redirect
  <http://wwwizer.com/naked-domain-redirect>

- Download static content pdf, binaries etc
  <http://stackoverflow.com/questions/32673993/how-do-i-provide-files-for-download>

- Datafiles - json, yaml etc.
  <https://jekyllrb.com/docs/datafiles/>
  - this provides a good mechanism, to control content creation - eg. could create index pages.
  - only thing missing is really zip files,

- Seo - eg. filling in title and meta description tags
  - <http://jekyll.tips/tutorials/seo/>

- Tags do work on Github pages, see
  - <http://blog.meinside.pe.kr/Adding-tag-cloud-and-archives-page-to-Jekyll/>

- Front matter is in YAML!
  <http://jekyllrb.com/docs/frontmatter/>
