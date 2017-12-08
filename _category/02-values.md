---
tag: values
permalink: /values
title: Wartości
---


<div class="content">
    <article class="post">
        <p>
            Staramy się budować zespół w oparciu o pewne wartości — zestaw zasad, które powinny wyznaczać
            sposób pracy, rozwiązywać problemy i pomagać w przypadku impasu. Dzięki nim wiemy dlaczego wybieramy
            konkretne rozwiązania i nie mamy nieporozumień w jakim kierunku idziemy jako team.
        </p>
        <p>
            Piszemy też o naszej kulturze organizacyjnej, sposobie pracy i atmosferze, która panuje w biurze.
        </p>
    </article>
</div>

{% for post in site.categories[page.tag] %}
{% include post_preview.html %}
{% endfor %}
