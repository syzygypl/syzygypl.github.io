---
layout: post
title:  Efektywne wykorzystanie narzędzi
date:   2017-08-11 12:42:51 +0200
category: values
---

Moje pierwsze tygodnie, a nawet miesiące, w firmie to seria zderzeń z innymi podejściami i rozwiązaniami. Jedną z większych zmian, które udało nam się szybko wprowadzić było inne spojrzenie na gotowe rozwiązania. 

Nie mówię tu tylko o wykorzystaniu gotowych bibliotek PHP/JS. To też, ale to trochę banalny przykład. Chodzi mi bardziej o narzędzia SaaS, hostowanie własnych rozwiązań vs utrzymywanych na zewnątrz, budowanie własnych systemów zamiast dostosowywania istniejących do naszych potrzeb (i trochę też naszych procesów do narzędzi).

## Za i przeciw

Można się zastanawiać, czy takie podejście na pewno jest odpowiednie dla naszego biznesu. 

 * Uzależniamy się od zewnętrznych firm i usług, które mogą zamknąć działalność, zmienić usługę albo zwiększyć ceny. 
 * Gotowe rozwiązania nie są wystarczająco elastyczne, aby dostosować je do wysokich wymagań Klientów
 * Istnieje pewne zagrożenie związane z kwestią bezpieczeństwa danych, które opuszczają obszary kontrolowane przez nas i trafiają do zewnętrznych firm
 * Stały koszt korzystania z takich usług może przekraczać koszt własnego utrzymania ich alternatyw

## Przydatność w kluczowym momencie

Do powyższej listy minusów można oczywiście dodać tyle samo lub więcej plusów i bez kontekstu ciężko ocenić jakie podejście jest lepsze. W praktyce jednak, jest szereg sytuacji, w których musieliśmy decydować się na gotowce, aby pozostać rentowni lub aby projekt zakończył się sukcesem:

 * Budowanie własnych rozwiązań to inwestycja. Większy koszt z góry, ale oszczędności później. Często nie mieliśmy czasu ani potrzeby na takie postępowanie. 
	* W jednym z pierwszych projektów, które stawialiśmy na Symfony, zastanawialiśmy się nad budowaniem własnego, zamkniętego CMS-a. Pewnie sporo firm przywiązuje w ten sposób do siebie Klientów (vendor lock-in), ale uznaliśmy, że to nie w naszym stylu. Wybraliśmy gotowe rozwiązanie open source, które pozwoliło nam skupić się na domenie biznesowej Klienta i spokojnie dowieźć jego funkcjonalności.
	* Niedawno robiliśmy mały projekt związany z social mediami. Znów przyszła ochota budowania własnego rozwiązania „na przyszłość”. Na szczęście skorzystanie z gotowca pozwoliło nam zamknąć projekt w budżecie. 
* Nigdy nie wiemy, jakie zadanie przyjdzie następnego dnia. Zły wybór narzędzi na starcie może oznaczać większe koszty utrzymania w późniejszym terminie. Do tej pory — szczęśliwie dla nas — zwykle jesteśmy mile zaskoczeni tym, że kolejne wymagania Klienta są proste do implementacji w narzędziach, których używamy.
* Gotowe rozwiązania dają nam wyższą jakość poza dzieciną naszej specjalizacji. Nie musimy się więc znać np. na przetwarzaniu wiedo i przewidzieć wszystkie problemy przed przystąpieniem do projektu. Nawet posiadając podstawową wiedzę możemy skutecznie realizować zadania w sposób, który jakością nie odstaje od pozostałych części systemu. 

## Mówimy o *efektywnym* wykorzystaniu

Myśląc o tej wartości skupiamy się na efektywności danego rozwiązania. Nie chodzi o to, żeby ślepo pakować pieniądze w zagraniczne startupy, ale żeby mieć swiadomość i umieć uzasadnić korzyści wynikajace z takiej decyzji. A czasem wręcz przeciwnie — aby zauważać przypadki, w których to właśnie domowe rozwiązania będą robiły lepszą robotę w danej sytuacji.
