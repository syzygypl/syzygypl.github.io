---
title: Dług techniczny
excerpt: Porównałem dług techniczny do długu finansowego — efektywne narzędzie do ominięcia braku zasobów w jednym momencie, licząc na to, że w późniejszym czasie będzie nam łatwiej „spłacić“ takie zobowiązanie. Wspomniałem o nieoczywistych momentach, w których zaciągamy dług, jak np podczas doboru nieodpowiedniej technologii, odchodzenie od rynkowych standardów albo... nic nie robiąc, bo dług techniczny sam z siebie narasta. Wspomniałem też o tym jak sobie z nim radzić w organizacji — przede wszystkim poprzez mierzenie jego poziomu oraz aktywną pracę z Klientem, aby utrzymywać go na komfortowym poziomie
category: technology
date: 2019-03-26 22:34
author: maciej-lebkowski
layout: post
---

Słowem wstępu.

Prowadziłem ostatnio retrospekcję jednego z projektów. Przeglądając notatki z sekcji „problemy” zaczął kształtować się jeden, bardzo jasny komunikat — mamy problem z długiem technicznym. Nie był to też odosobniony przypadek, a w dodatku objawiał się w tym projekcie w szczególny — oraz dość nieprzewidywany — sposób. Był to doskonały pretekst, żeby podsumować sobie czym jest dług techniczny, co wpływa na jego pogłębianie oraz jak nim zarządzać.

## Ale dług jest techniczny czy technologiczny?

Nie zbaczając za daleko z tematu: ja piszę o technicznym, jeśli ktoś życzy sobie dowiedzieć czegoś o technologicznym, to zapraszam w inne miejsce.

## Czym jest dług techniczny?

Tak jak każdy dług, jest to przeniesienie pewnych zasobów w czasie — w tym przupadku chodzi o umiejętności programistów, czas lub przychylne spojrzenie Klienta. Tworzymy oprogramowanie pożyczając sobie te rzeczy z przyszłości, licząc na to, że w późniejszej dacie będzie nam łatwiej o te rzeczy, wraz z nawiązką. 

Tak jak w przypadku zadłużenia finansowego, mówimy o normalnym narzędziu, które jest bardzo popularnie używane i wcale nie należy go unikać, a jedynie **kontrolować jego poziom**.

Można próbować klasyfikować powody na rozważne i nierozważne, a z drugiej strony celowe lub nieumyślne, ale dziś nie będę wchodził dalej w teorię, przejdźmy do praktyki. 

Istotne jest to, że dług będziemy musieli kiedyś spłacić, prawdopodobnie z odsetkiami. Postaram się więc skupić na wskazaniu tych odsetek — czyli dodatkowych kosztów — w wymienianych przypadkach.

## W jaki sposób powstaje dług techniczny?

W popularnym rozumieniu „rozwiązania na skróty” są synonimem długu technicznego. Często myślimy o słabym zespole, albo takim, który po prostu nie dba o wyższą jakość wytwarzanego oprogramowania. Z drugiej strony może to być czynnik zewnętrzny w postaci presji czasowej. Efekt — realizujemy rozwiązanie w pewnym wymiarze ułomne, z pełną świadomością. 

Jest to opis dość lakoniczny, wejdę więc w szczegóły.

### Presja czasowa lub budżetowa

Terminy i budżety często idą w parze i na potrzeby tego wytłumaczenia można traktować je jednakowo. Jeśli rozwiązanie optymalne zajmie więcej czasu, niż jesteśmy w stanie na nie poświęcić, to swiadomie decydujemy się na zaciąganie długu, realizując wymagania biznesowe w sposób prostszy.

Efekt — oprogramowanie, które nie spełnia wszystkich wymagań, ma ukryte błędy lub ryzyko błędów. Możliwe też, że zamiast efektów widocznych od razu, zwiększamy sobie „oprocentowanie długu”, a przez to wszelkie inne działania mogą okazać się bardziej kosztowne.

### Brak umiejętności zespołu

Często dług techniczny nie jest wcale zaciągany świadomie. Zespół dopiero z czasem może zrozumieć, że przyjęte przez nich rozwiązanie ogranicza możliwości rozwoju w przyszłości. Może to być po prostu brak warsztatowy lub brak doświadczenia w podobnych realizacjach, uniemożliwiający przewidzenie przyszłych problemów.

W takim przypadku trzeba się zadłużyć, aby naprawić swoje problemy wraz ze wzrostem kompetencji w przyszłości, niejednokrotnie wykonując ponownię tę samą pracę, nie dodając wartości biznesowej produktowi.

### Brak planowania i odpowiedniej architektury

Naturalnym jest, że ogólna forma i architektura rozwiązania małego lub średniej wielkości będzie się różnić od tej dla rozwiązania dużej skali. Dobranie nieodpowiedniego rozwiązania (świadomie lub nie) będzie powodowało problemy lub nieefektywną pracę na dalszych etapach projektu.

### Zmiana wymagań

Oczywiście nie chodzi o samą zmianę, ale o nieodpowiednie do niej podejście. Przykładowo, jeśli dobierzemy odpowiednią architekturę do naszego rozwiązania średniej skali, ale z czasem zmienią się wymagania i zmieni się skala projektu, mamy dwie możliwości:

 * Kontynuować pracę w istniejącej architekturze, dokładając tym samym do długu technicznego (patrz poprzedni punkt)
 * Zaplanować — często kosztowną — zmianę architektury

### Brak dokumentacji oraz testów automatycznych

Zaczynamy wchodzić w tematy mniej oczywiste. Kod nieudokumentowany (a testy automatyczne są formą dokumentacji) jest traktowany jako kod legacy, czyli taki, którego działania nie jesteśmy w stanie z góry przewidzieć. Nie jesteśmy też w stanie określić wszystkich wymagań, które spełnia. 

Powoduje to, że jego zmiana jest ryzykowna oraz kosztowna, a często wręcz jesteśmy sparaliżowani i wpadamy w błędne koło — bojąc się usprawnień tkwimy w sytuacji, która z czasem ma szansę się jedynie pogorszyć.

### Niespójność z obowiązującymi standardami

Odchodzenie od sposobów powszechnie przyjętych — np. w innych projektach podobnego typu. Rozpatrując ten punkt w kontekscie stałego zespołu nie jesteśmy w stanie zauważyć zagrożenia. Sprawa pokazuje się z innej perspektywy gdy myślimy o powiększeniu lub wymianie członków tego zespołu. Jeśli trzymamy się ogólnie przyjętych wzorców, mamy dużą szansę znaleźć na rynku pracy specjalistów obeznanych z tymi zasadami. W przeciwnym wypadku poszukujemy niszowych, wysoko płatnych pracowników, albo nasz proces wdrożenia trwa — i kosztuje — znacznie więcej niż byłoby to dla nas komfortowe.

### Brak prac utrzymaniowych

Zarówno z braku inicjatywy zespołu jak i ze świadomej decyzji Klienta (mającej na celu np. ograniczenie kosztów). Wiąże się to z większością powyższych punktów:

 * Z czasem zmieniają się wymagania, ale nie zawsze przy każdym z nich potrzebna jest redukcja długu. Jednak raz na jakiś czas warto takie prace zaplanować
 * Zmieniajacy się zespół — czy to ze względu na powiększanie kompetencji, czy ich zmianę (a co za tym idzie zmianę strefy komfortu) — potrzebuje dostosować do siebie środowisko i sposoby pracy
 * Najlepsze rozwiązanie na rynku dziś, w przyszłości może być (i prawdopodobnie będzie, to kwestia czasu) nieadekwatne — a wtedy skompletowanie zespołu będzie niemożliwe lub zbyt kosztowne

## Czy zawsze należy ograniczać dług?

Oczywiście nie. Skrajnym przypadkiem jest analogia do bankructwa — możemy zaciągać dług ponad nasze możliwości, ale nigdy nie ponosić tego konsekwencji. W świecie oprogramowania jest to projekt, który nie będzie rozwijany lub po prostu jego przydatność jest ograniczona czasowo.

Powtórzę raz jeszcze — nie chodzi o eliminację, ale o utrzymywanie go w komfortowym poziomie. Gdzie znajduje się ten poziom? To decyzja biznesowa — np. niektórzy ludzie zawsze żyją na kredyt, podobnie może być z projektami.

## Czy dobór technologii ma wpływ na dług techniczny?

Tak, ale jest to pewien paradoks. Weźmy dla przykładu rozwiązania pudełkowe, jak np. Drupal czy Magento (to akurat z naszego podwórka). Decyzja o takim stacku na pewno pozytywnie wpłynie na poziom dokumentacji albo dostosowanie się do rynkowych standardów (łatwiej znaleźć specjalistę od Magento, niż od prywatnego rozwiązania stworzonego w agencji). Niestety z drugiej strony jest to system, który nie sprzyja dobrym praktykom programowania (w uproszczeniu rzecz biorąc), zwiększając ilość rozwiązań na skróty (poprzez syndrom wybitych okien) albo ograniczając ilość testów automatycznych.

Trzeba więc wyważyć, gdzie ten dług będzie bardziej nas bolał i podjąc strategiczną decyzję, licząc na pomyślne rozwiązanie w przyszłości. 

## Konsekwencje

Dla organizacji i zespołów, negatywne efekty długu technicznego powodują:

 * Obniżoną motywację zespołu, [efekt wybitych szyb](https://www.wikiwand.com/pl/Teoria_rozbitych_okien), dalsze pogłębianie długu.
 * Utrudnioną rekrutację — poprzez zwiększony czas rekrutacji i jej większe koszty — na rynku pracownika nikt nie będzie się godził na słabe warunki pracy, a niski poziom długu technicznego jest bardzo pożądany przez programistów.
 * Zwiększony koszt wdrożenia nowych osób (jeśli się je już znajdzie). Elementy takie jak niestandardowe rozwiązania, braki testów i dokumentacji negatywnie wpływaja na możliwości zrozumienia aplikacji przez osoby dołączające do zespołu.
 * Zwiększone koszty utrzymania. Do decyzji mamy albo pogłębiać poziom długu, pakując się w jeszcze większe tarapaty kosztowe, albo przeznaczać część budżetu na jego redukcję lub utrzymanie na satysfakcjonującym poziomie.
 * Zwiększone ryzyko błędów — kod niezrozumiały, zawiły, odbiegający od oczekiwań, bez testów automatycznych jest częstą przyczyną wadliwego oprogramowania.
 * A w skrajnych przypadkach brak praktycznej możliwości realizacji wymagań Klienta — czy to przez ograniczenia budżetowe (nie stać nas na utrzymanie), zasobowe (nie znaleźliśmy specjalistów, którzy są w stanie wdrożyć się w projekt) lub po prostu ryzyko regresji (zepsucia działającej funkcji podczas wprowadzania nowej) jest zbyt wysokie i biznesowo nie możemy sobie na to pozwolić.

## Case study — frameworki frontendowe

Bijąc się w pierś opowiem o historii, która zdecydowanie nie jest jednym z moich sukcesów i wynika — z perspektywy czasu — ze źle podjętej strategicznej decyzji. 

Mniej więcej trzy-cztery lata temu, wprowadzając nowe technologie do Syzygy (wtedy jeszcze Ars Thanea), zdecydowaliśmy się — a ja byłem głownym orędownikiem tych zmian — na połączenie Symfony, Twig oraz gulp. Był to sprawdzony zestaw narzędzi, dobrze rozumiany przez zarówno frontendowców jak i backendowców — tak u nas w firmie jak i na rynku pracy. Zaangażowaliśmy się w to rozwiązanie, realizujac w nim kolejne wdrożenia, budując nasze inventory i z czasem opierając na nim naszą skuteczność.

Było to… W zasadzie powinienem napisać: jest to rozwiązanie bardzo silne technologicznie, realizujące nasze potrzeby (oraz naszych Klientów), lubiane przez zespół, relatywnie proste do podchwycenia i zmian. Dlaczego więc piszę o tym w kontekście długu?

Równolegle, mniej więcej w tym samym czasie, niezwykłą popularność zyskały szkoły programowania typu Coders Lab. Zapatrzony w swoje przekonania i umiejętności nie zauważyłem, że osoby wchodzące na rynek pracy w przeważającej większości nie znają tych technologii, bo najzwyczajniej w świecie w procesie ich szkolenia są uczone nowoczesnych frameworków frontendowych takich jak React, Vue czy Angular.  

W efekcie nie jest już istotne jak dobrym — obiektywnie rzecz biorąc — był nasz wybór. W oczach naszych potencjalnych przyszłych pracowników nasze systemy są systemami legacy i nie dają im możliwości rozwoju w kierunkach, które ich motywują (a alternatyw na rynku pracy nie brakuje). Nasz zespół jest w stanie sprawnie nad nimi pracować, ale nie możemy skalować się w takim tempie, jak tego potrzebujemy. 

Brak zmiany kierunku w odpowiednim momencie spowodował stworzenie długu technicznego, który po kilku latach znacząco zwiększa nam koszt i czas rekrutacji, koszt utrzymania zespołu i negatywnie wpływa na jego motywację. 

## Wnioski

Całe to podsumowanie nie miało by sensu, jeśli nie płynęłaby z niego jakaś nauka. Następujące elementy są dla Syzygy istotne, aby zarządzać długiem technicznym:

 * Używanie rynkowych standardów. Naturalnym wnioskiem z przytoczonej historii była decyzja o zmianie stacku na taki, który używa jednego z frameworków frontendowych zamiast „klasycznego” podejścia. Możliwość szybkiego skalowania zespołu jest dla nas dużo ważniejsza, niż budowanie efektywności poprzez długoletnie doświadczenie w jednym rozwiązaniu.
 * Ciągła aktualizacja używanych rozwiązań. Analogicznie do kompletnej zmiany frameworków, również te istniejące już trzeba aktualizować do bieżących wersji, otwierając się na możliwości nowych bibliotek open source oraz przyciągając lepszych kandydatów do pracy.
 * Upewnienie się o odpowiednim poziomie testów jednostkowych i dokumentacji w projektach. Często przymykaliśmy na to oko, rozumiejąc, że jest to pewien kompromis. Teraz jednak szale się przeważyły i wraz z rosnącym udziałem projektów utrzymaniowych, istnienie wysokiego pokrycia testów staje się dużo ważniejsze.
 
Na koniec jeszcze dwa punkty, które są niejako wisienką na torcie naszych wniosków. 

### Mierniki

Przede wszystkim brakowało nam w organizacji świadomości na temat poziomu długu technicznego. Wśród programistów ta wiedza na poziomie intuicyjnym na pewno była, ale nigdy nie używaliśmy formalnych mierników, aby go określić. W skrócie — nie wiedząc jak wygląda, na pewno nie jesteśmy w stanie nim zarządzać. 

Mamy więc w planach dodanie do checklist statusowych rozmowy na temat długu technicznego. Dopóki nie jesteśmy w stanie sprowadzić go do konkretnych liczb (tak jak ma to miejsce w przypadku np. rentowności), opierajmy się przynajmniej na subiektywnych odczuciach.

### Zaangażujmy Klienta

Bez świadomości i zrozumienia Klienta, w naszym trybie pracy redukcja długu technicznego byłaby walką z wiatrakami. Od teraz, wiedząc więcej o stanie naszych projektów, jesteśmy w stanie rzetelnie informować i doradzać Klientowi odpowiedni kurs działania, ale przede wszystkim zaangażować go w decyzję. W takim modelu mamy szansę na najlepszą efektywność zwalczania długu — agencja ocenia, informuje i sugeruje, a konkretne działania planuje biznes — samemu godząc się na ewentualne ryzyka.

## Na zakończenie

To tylko jeden punkt widzenia, dość przy tym okrojony — mam wrażenie, że prześlizgujemy się jedynie po powierzchni tematu, a to co faktycznie możemy robić w tej sprawie może znacząco odmienić się w nadchodzących miesiącach i latach. Mamy jednak solidną podstawę do tego aby rozumieć i zacząc skutecznie zarządzać długiem technicznym.
