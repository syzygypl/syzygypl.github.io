---
title: Dług techniczny
excerpt: Porównałem dług techniczny do długu finansowego — efektywne narzędzie do ominięcia braku zasobów w jednym momencie, licząc na to, że w późniejszym czasie będzie nam łatwiej „spłacić” takie zobowiązanie. Wspomniałem o nieoczywistych momentach, w których zaciągamy dług, jak np. podczas doboru nieodpowiedniej technologii, odchodzenie od rynkowych standardów albo... nic nie robiąc, bo dług techniczny sam z siebie narasta. Wspomniałem też o tym jak sobie z nim radzić w organizacji — przede wszystkim poprzez mierzenie jego poziomu oraz aktywną pracę z Klientem, aby utrzymywać go na komfortowym poziomie
category: technology
date: 2019-03-26 22:34
author: puck
layout: post
---

Słowem wstępu.

Prowadziłem ostatnio retrospekcję jednego z projektów. Przeglądając notatki z sekcji „problemy” zaczął kształtować się jeden, bardzo jasny komunikat — mamy problem z długiem technicznym. Nie był to też odosobniony przypadek, a w dodatku objawiał się w tym projekcie w szczególny — oraz dość nieprzewidywalny — sposób. Był to doskonały pretekst, żeby podsumować czym jest dług techniczny, co wpływa na jego pogłębianie oraz jak nim zarządzać.

## Ale dług jest techniczny czy technologiczny?

Zależy kto mówi, bo pojęcie jest jedno, tylko różnie nazywane. Nie wchodząc w potyczki słowne: będę używał tego pierwszego zwrotu. 

## Czym jest dług techniczny?

Tak jak każdy dług, jest to **przeniesienie pewnych zasobów w czasie** — w tym przypadku chodzi o umiejętności programistów, czas lub przychylne spojrzenie Klienta. Tworzymy oprogramowanie pożyczając sobie te rzeczy z przyszłości, licząc na to, że później będzie nam łatwiej o te rzeczy, wraz z nawiązką. 

Tak jak w przypadku zadłużenia finansowego, mówimy o narzędziu, które jest bardzo popularnie używane i wcale nie trzeba go za wszelką cenę unikać, a jedynie **kontrolować jego poziom**.

Można próbować klasyfikować powody jego powstawania na rozważne i nierozważne, a z drugiej strony celowe lub nieumyślne, ale dziś nie będę wchodził dalej w teorię, przejdźmy do praktyki. 

Istotne jest to, że dług będziemy musieli kiedyś spłacić, prawdopodobnie z odsetkami. Postaram się więc skupić na wskazaniu tych odsetek — czyli dodatkowych kosztów — w wymienianych przypadkach.

Będę się również skupiał na szerszym rozumieniu tego pojęcia — czyli wszystkie decyzje, które w efekcie wydłużają lub utrudniają proces wytwarzania oprogramowania w przyszłości. Nawet jeśli nie są to *stricte* elementy długu technicznego, to warto o nich myśleć w podobny sposób oraz używać tych samych narzędzi do ich redukcji.

## W jaki sposób powstaje dług techniczny?

W popularnym rozumieniu „rozwiązania na skróty” są synonimem długu technicznego. Często myślimy o słabym zespole albo takim, który po prostu nie dba o wyższą jakość wytwarzanego oprogramowania. Z drugiej strony może to być czynnik zewnętrzny w postaci presji czasowej. Efekt — realizujemy rozwiązanie w pewnym wymiarze ułomne, z pełną świadomością. 

Jest to opis dość lakoniczny, wejdę więc w szczegóły.

### Presja czasowa lub budżetowa

Terminy i budżety często idą w parze i na potrzeby tego wytłumaczenia można traktować je jednakowo. Jeśli rozwiązanie optymalne zajmie więcej czasu, niż jesteśmy w stanie na nie poświęcić, to świadomie decydujemy się na zaciąganie długu, realizując wymagania biznesowe w sposób prostszy.

Efektem jest oprogramowanie, które nie spełnia wszystkich wymagań, ma ukryte błędy lub ryzyko błędów. Możliwe też, że zamiast efektów widocznych od razu, zwiększamy sobie „oprocentowanie długu”, a przez to wszelkie inne działania mogą okazać się bardziej kosztowne.

### Brak umiejętności zespołu

Często dług techniczny nie jest zaciągany świadomie. Zespół dopiero z czasem może zrozumieć, że przyjęte przez nich rozwiązanie ogranicza możliwości rozwoju w przyszłości. Może to być po prostu brak warsztatowy lub brak doświadczenia w podobnych realizacjach, uniemożliwiający przewidzenie nadchodzących problemów.

W takim przypadku trzeba się zadłużyć, aby polepszyć jakość kodu wraz ze wzrostem kompetencji w przyszłości, niejednokrotnie wykonując ponownie tę samą pracę, nie dodając wartości biznesowej produktowi (czyli przytaczany często *refactoring*).

### Brak planowania i odpowiedniej architektury

Naturalnym jest, że ogólna forma i architektura małego lub średniej wielkości modułu będzie się różnić od tej dla modułu dużej skali. Dobranie nieodpowiedniego rozwiązania (świadomie lub nie) będzie powodowało problemy lub nieefektywną pracę na dalszych etapach projektu — z jednej strony poprzez narzut związany z architekturą (zwany często *boilerplate*), lub z drugiej poprzez ograniczenia wynikające z niedostatecznie elastycznej architektury.

### Zmiana wymagań

Oczywiście nie chodzi o samą zmianę, ale o nieodpowiednie do niej podejście. Przykładowo, jeśli dobierzemy odpowiednią architekturę do naszego rozwiązania średniej skali, ale z czasem zmienią się wymagania i zmieni się skala projektu, mamy dwie możliwości:

 * Kontynuować pracę w istniejącej architekturze, zwiększając tym samym poziom długu technicznego (patrz poprzedni punkt)
 * Zaplanować — często kosztowną — zmianę architektury. Oszczędność wynikająca z porzucenia tych prac może wydawać się łakomym kąskiem dla decydentów w projekcie, jednak warto przekalkulować, czy ten koszt nie wróci do nas zwielokrotniony za jakiś czas.

### Brak dokumentacji oraz testów automatycznych

Zaczynamy wchodzić w tematy mniej oczywiste. Kod nieudokumentowany (a testy automatyczne są formą dokumentacji) jest traktowany jako kod legacy, czyli taki, którego działania nie jesteśmy w stanie z góry przewidzieć. Nie jesteśmy też w stanie określić wszystkich spełnianych przez niego wymagań. 

Powoduje to, że jego zmiana jest ryzykowna oraz kosztowna, a często wręcz jesteśmy sparaliżowani i wpadamy w błędne koło — bojąc się usprawnień tkwimy w sytuacji, która z czasem może jedynie się pogorszyć.

### Niespójność z obowiązującymi standardami

Odchodzenie od reguł powszechnie przyjętych — np. w innych projektach podobnego typu. Rozpatrując ten punkt w kontekście stałego zespołu nie jesteśmy w stanie zauważyć zagrożenia. Sprawa pokazuje się z innej perspektywy, gdy myślimy o powiększeniu lub wymianie członków tego zespołu. Jeśli trzymamy się ogólnie przyjętych wzorców, mamy dużą szansę znaleźć na rynku pracy specjalistów obeznanych z tymi zasadami. W przeciwnym wypadku poszukujemy niszowych, wysoko płatnych kandydatów, albo nasz proces wdrożenia trwa — i kosztuje — znacznie więcej niż byłoby to dla nas komfortowe.

### Brak prac utrzymaniowych

Zarówno z braku inicjatywy zespołu jak i ze świadomej decyzji Klienta (mającej na celu np. ograniczenie kosztów). Wiąże się to z większością powyższych punktów:

 * Z czasem zmieniają się wymagania i o ile nie przy każdej z nich potrzebna jest redukcja długu, to raz na jakiś czas warto takie prace zaplanować.
 * Zmieniający się zespół — czy to ze względu na powiększanie kompetencji, czy ich zmianę (a co za tym idzie zmianę narzędzi, w których czuje się komfortowo) — potrzebuje dostosować do siebie środowisko i sposoby pracy.
 * Najlepsze rozwiązanie na rynku dziś, w przyszłości może być nieadekwatne (i prawdopodobnie będzie, to kwestia czasu) — a wtedy skompletowanie zespołu będzie niemożliwe lub zbyt kosztowne.

## Czy zawsze należy ograniczać dług?

Oczywiście nie. Skrajnym przypadkiem jest analogia do bankructwa — możemy zaciągać dług ponad nasze możliwości, ale nigdy nie ponosić tego konsekwencji. W świecie oprogramowania jest to projekt, który nie będzie rozwijany lub po prostu jego przydatność jest ograniczona czasowo.

Powtórzę raz jeszcze — nie chodzi o eliminację, ale o **utrzymywanie go na komfortowym poziomie**. Gdzie znajduje się ten poziom? To decyzja biznesowa — np. niektórzy ludzie zawsze żyją na kredyt, podobnie może być z projektami.

## Czy dobór technologii ma wpływ na dług techniczny?

Tak, ale jest to pewien paradoks. Weźmy dla przykładu rozwiązania pudełkowe, jak np. Drupal czy Magento (to akurat z naszego podwórka). Decyzja o takim stacku na pewno pozytywnie wpłynie na poziom dokumentacji albo dostosowanie się do rynkowych standardów (łatwiej znaleźć specjalistę od Magento, niż od prywatnego rozwiązania stworzonego w agencji). Niestety z drugiej strony jest to system, który nie sprzyja dobrym praktykom programowania (w uproszczeniu), zwiększając ilość rozwiązań na skróty (poprzez syndrom wybitych okien) albo ograniczając ilość testów automatycznych.

Mówię o tym oczywiście w kontekście naszej organizacji, bo z pewnością istnieją zespoły, dla których nie jest to wcale problem — ale to kolejna cecha długu technicznego: nie można rozpatrywać go obiektywnie, a w konkretnym kontekście. 


## Konsekwencje

Dla organizacji i zespołów, wysoki poziom długu technicznego powoduje szereg problemów. Większości z nich nie widać od razu, ale dopiero po czasie, co czyni całą sytuację jeszcze groźniejszą. Nikt przecież nie chwali projektu, który po prostu działa i posuwa się sprawnie do przodu, ale każdy zauważa jego braki i problemy, jeśli po tygodniach lub miesiącach tempo zauważalnie zwalnia, ilość błędów rośnie, a zmiany niegdyś trywialne teraz są ryzykowne i wymagają dokładnego planowania. 

Dług techniczny powoduje:

 * Obniżoną motywację zespołu, [efekt wybitych szyb](https://www.wikiwand.com/pl/Teoria_rozbitych_okien), dalsze pogłębianie długu.
 * Utrudnioną rekrutację poprzez zwiększony czas oraz koszty. Na rynku pracownika nikt nie będzie się godził na słabe warunki pracy, a niski poziom długu technicznego jest bardzo pożądany przez programistów (nawet jeśli nie pytają o niego wprost, to zauważą jego efekty przejawiające się w projektach).
 * Zwiększony koszt wdrożenia nowych osób (jeśli już się je znajdzie). Elementy takie jak niestandardowe rozwiązania, braki testów i dokumentacji, cele biznesowe niespójne z architekturą, etc. negatywnie wpływają na możliwości zrozumienia aplikacji przez osoby dołączające do zespołu. 
 * Zwiększone koszty utrzymania. Do decyzji mamy albo pogłębiać poziom długu, pakując się w jeszcze większe tarapaty kosztowe, albo przeznaczać część budżetu na jego redukcję lub utrzymanie na satysfakcjonującym poziomie.
 * Zwiększone ryzyko błędów — kod niezrozumiały, zawiły, odbiegający od oczekiwań, bez testów automatycznych jest częstą przyczyną wadliwego oprogramowania.
 * A w skrajnych przypadkach brak praktycznej możliwości realizacji wymagań Klienta — czy to przez ograniczenia budżetowe (nie stać nas na utrzymanie), zasobowe (nie znaleźliśmy specjalistów, którzy są w stanie wdrożyć się w projekt) lub po prostu ryzyko regresji (zepsucia działającej funkcji podczas wprowadzania nowej) jest zbyt wysokie i biznesowo nie możemy sobie na nie pozwolić.

## Case study — frameworki frontendowe

Bijąc się w pierś opowiem o historii, której zdecydowanie nie mogę zaliczyć do moich sukcesów, a wynika ona — z perspektywy czasu — z jednej bardzo zasadnej merytorycznie, ale złej z punktu strategicznego decyzji. 

Mniej więcej trzy-cztery lata temu, wprowadzając nowe technologie do Syzygy (wtedy jeszcze Ars Thanea), zdecydowaliśmy się — a ja byłem głównym orędownikiem tych zmian — na połączenie Symfony, Twig oraz gulp. Był to sprawdzony zestaw narzędzi, dobrze rozumiany przez zarówno frontendowców jak i backendowców — tak u nas w firmie jak i na rynku pracy. Zaangażowaliśmy się w to rozwiązanie, realizując w nim kolejne wdrożenia, budując nasze inventory (czyli gotowe rozwiązania, które mogliśmy przenosić pomiędzy projektami) i z czasem opierając na nim naszą skuteczność.

Było to… W zasadzie powinienem napisać: jest to rozwiązanie bardzo silne technologicznie, realizujące nasze potrzeby (oraz naszych Klientów), lubiane przez zespół, relatywnie proste do podchwycenia i zmian. Nie ma w nim żadnych minusów, dlaczego więc piszę o tym w kontekście długu?

Równolegle, mniej więcej w tym samym czasie, niezwykłą popularność zyskały szkoły programowania typu Coders Lab. Zapatrzony w swoje przekonania i umiejętności nie zauważyłem, że osoby wchodzące na rynek pracy w przeważającej większości są właśnie po takim kursie, na którym uczone były nowszego podejścia, używającego rozwiązań takich jak React, Vue czy Angular. Dla nich nasze rozwiązanie było obce, niezrozumiałe i z poprzedniej epoki.

W efekcie nie jest już istotne jak dobrym — obiektywnie rzecz biorąc — był nasz wybór. W oczach naszych potencjalnych przyszłych pracowników nasze systemy są systemami legacy i nie dają im możliwości rozwoju w kierunkach, które ich motywują (a alternatyw na rynku pracy nie brakuje). Nasz zespół jest w stanie sprawnie nad nimi pracować, ale my nie możemy skalować się w takim tempie, jak tego potrzebujemy. 

Brak zmiany kierunku w odpowiednim momencie spowodował stworzenie długu technicznego, który po kilku latach znacząco zwiększa nam koszt i czas rekrutacji, koszt utrzymania zespołu i negatywnie wpływa na jego motywację. Dzieli również wewnętrznie organizację (na osoby ze starym oraz nowym podejściem), utrudniając przepływ wiedzy i możliwości przejścia do innych projektów.

## Wnioski

Całe to podsumowanie nie miałoby sensu, jeśli nie płynęłaby z niego jakaś nauka. Następujące elementy są dla Syzygy istotne, aby zarządzać długiem technicznym:

 * Używanie rynkowych standardów. Naturalnym wnioskiem z przytoczonej historii była decyzja o zmianie stacku na taki, który używa jednego z frameworków frontendowych zamiast „klasycznego” podejścia. Możliwość szybkiego skalowania zespołu jest dla nas dużo ważniejsza niż budowanie efektywności poprzez długoletnie doświadczenie w jednym rozwiązaniu.
 * Ciągła aktualizacja używanych rozwiązań. Analogicznie do kompletnej zmiany frameworków, również te istniejące już trzeba aktualizować do bieżących wersji, otwierając się na możliwości nowych bibliotek open source oraz przyciągając lepszych kandydatów do pracy.
 * Upewnienie się o odpowiednim poziomie testów jednostkowych i dokumentacji w projektach. Często przymykaliśmy na to oko, rozumiejąc, że jest to pewien kompromis. Teraz jednak szala się przeważyła i wraz z rosnącym udziałem projektów utrzymaniowych, istnienie wysokiego pokrycia testów staje się dużo ważniejsze.
 * Wprowadzanie regularnego refactoringu, który sam w sobie nie przynosi wartości biznesowej, ale służy ograniczaniu poziomu długu na wczesnym etapie, nie pozwalając mu się rozrosnąć.
 
Na koniec jeszcze dwa punkty, które są niejako wisienką na torcie naszych wniosków. 

### Mierniki

Przede wszystkim brakowało nam w organizacji świadomości na temat poziomu długu technicznego. Wśród programistów ta wiedza na poziomie intuicyjnym na pewno była, ale nigdy nie używaliśmy formalnych mierników, aby go określić. W skrócie — nie wiedząc jak wygląda, na pewno nie jesteśmy w stanie nim zarządzać. 

Mamy więc w planach dodanie do checklist statusowych rozmowy na temat długu technicznego. Dopóki nie jesteśmy w stanie sprowadzić go do konkretnych liczb (tak jak ma to miejsce w przypadku np. rentowności projektu), opierajmy się przynajmniej na subiektywnych odczuciach.

### Zaangażujmy Klienta

Bez świadomości i zrozumienia Klienta, w naszym trybie pracy redukcja długu technicznego byłaby walką z wiatrakami. Od teraz, wiedząc więcej o stanie naszych projektów, mamy możliwość rzetelnie informować i doradzać Klientowi odpowiedni kurs działania, ale przede wszystkim zaangażować go w decyzję. W takim modelu mamy szansę na najlepszą efektywność zwalczania długu — agencja ocenia, informuje i sugeruje, a konkretne działania planuje biznes — samemu godząc się na ewentualne ryzyka.

## Na zakończenie

To tylko jeden, subiektywny punkt widzenia — mam wrażenie, że prześlizgujemy się jedynie po powierzchni tematu, a to co faktycznie możemy robić w tej sprawie może znacząco odmienić się w nadchodzących miesiącach i latach. Mamy jednak solidną podstawę do tego, aby rozumieć i zacząć skutecznie zarządzać długiem technicznym.


