---
title: Site map
layout: about
permalink: sitemap.html
---

<!-- html comment, it's iterating the non post content only -->


{% for tag in page.tags %}
  <h3>  {{ tag }} </h3>
{% endfor %}


#### Static files

{% for file in site.static_files %}
- [{{ file.path }}]({{ file.path }})
{% endfor %}


#### Posts

<!-- note the post path is local path, so use post.url instead -->
{% for post in site.posts  %}
- [{{ post.path }}]({{ post.url }})
{% endfor %}

#### Tags

tags work - only on post content, so structure using permalinks for menus

{% for tag in site.tags %}
  here -> {{ tag | first }}

  {% for post in site.posts %}

  {% endfor %}

{% endfor %}


#### Categories

{% for category in site.categories %}
  here -> {{ category | first }}
{% endfor %}

