---
tag: about-us
permalink: /about-us
title: O nas
---


<div class="content">
    <article class="post">
        <p>
            Trochę więcej na temat samego teamu Syzygy. Kim jesteśmy, skąd przyszliśmy i co nas wyróżnia.
        </p>
    </article>
</div>

{% for post in site.categories[page.tag] %}
{% include post_preview.html %}
{% endfor %}
