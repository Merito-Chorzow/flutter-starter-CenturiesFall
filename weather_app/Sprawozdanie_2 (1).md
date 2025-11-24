# Sprawozdanie 2: Budowa aplikacji mobilnych z użyciem technologii frontendowych

**Imię i nazwisko studenta:** Marcin Grabania
**Grupa:** Grupa 1
**Data:** 24.11.2025

---

## Część teoretyczna

### Hybrydowe aplikacje mobilne vs. natywne aplikacje mobilne

**Zagadnienie:**  
Opisz różnice pomiędzy aplikacjami hybrydowymi a natywnymi pod względem architektury, wydajności, dostępu do zasobów urządzenia i kosztów wytwarzania. Wskaż zalety i wady każdego podejścia oraz przykłady technologii, które je reprezentują (np. React Native, Flutter, NativeScript, Kotlin, Swift).

**Pytania kontrolne:**

1. Co decyduje o tym, że aplikacja jest natywna, a co — że hybrydowa?
2. Jakie są kluczowe różnice w wydajności między tymi rozwiązaniami?
3. W jakich przypadkach warto wybrać rozwiązanie hybrydowe, a w jakich natywne?
4. Jak wygląda utrzymanie i rozwój aplikacji w obu podejściach?

**Aplikacje natywne**:
Aplikacje natywne są tworzone dla konkretnego systemu np. Android (Kolin, Java) lub iOS (Swift, Objective-C). Są instalowane bezporśrednio na urządzeniu użytkownika, oraz posiadają dostęp do funkcji takich jak gps, aparat czy powiadomienia push. Dzięku temu działają one szybciej, płynniej i są bardziej niezawodne niż aplikacje utworzone w innych technologiach. Sprawdzają się lepiej w złożonych projektach przez swoją wydajność i dostęp do różnych funkcji. Są też bardziej odporne na błędy i łatwiejsze w testowaniu. Koszty developmentu są większe przez konieczność tworzenia oddzielnych wersji aplikacji dla Androida i iOS. Utrzymanie jest trudniejsze, każda aktualizacja musi być wdrażana osobno dla każdej wersji aplikacji

**Aplikacje hybrydowe**:
Aplikacje hybrydowe tworzone są za pomocą technologii webowych ( HTML, CSS, JavaScript), i korzystają z frameworków takich jak React Native, Flutter lub Ionic. Przez to jeden wspólny kkod może zostać uruchomiony na różnych platformach, zarówno jak na Adroidzie i iOs. Znacząco skraca to czas i koszty developmentu, np. przy projekcie, który musi szybko wyjść na rynek. Aplikacje hybrydowe nie posiadają takiej samej wydajności i dostępu do wszystkich funkcji co natywne. Lepiej sprawdzają się w prostych projektach. Niższe koszty tworzenia, jest ich atutem przez możliwość utworzenia jednego kodu działającego na Androidzie i iOS. Jedna baza kodu to mniej pracy przy aktualizacjach i poprawkach co przekłada się na łatwiejsze utrzymanie.

| Cecha                    | Aplikacje natywne                                                       | Aplikacje hybrydowe                               |
| ------------------------ | ----------------------------------------------------------------------- | ------------------------------------------------- |
| Języki programowania     | Swift, Objectice-C, Kotlin, Java                                        | HTML, CSS, JavaScript/TypeScirpt( Angular, React) |
| Wydajność                | Wysoka wydajność                                                        | Gorsza wydajność                                  |
| Dostęp do API urządzenia | Bezpośredni dostęp do wszystkich natywnych API oraz funkcji systemowych | Dostęp przez pluginy, lub frameworki              |
| Koszt utrzymania         | Wyższy, osobne wersje Android i iOS                                     | Niższe, jedna baza kodu                           |
| Czas wdrożenia           | Dłuższy, osobne procesy dla każdej platformy                            | Krótszy, szybkie wdrażanie, dzięki jednemu kodowi |
| Aktualizacje             | Osobno każdą wersję                                                     | Obejmuje wszystkie platfromy                      |

**Wnioski:**
Aplikacje natywne najlepiej wybrać gdy zależy nam na wydajności i pełnego dostępu do funkcji urządzenia, ale będzie to wymagać większego nakładu pracy, a hybrydowe najlepiej wybrać gdy chcemy szybciej oraz mniejszymi kosztami wdrożyć jakiś projekt.

### Progressive Web Apps (PWA) jako alternatywa dla tradycyjnych aplikacji mobilnych

**Zagadnienie:**  
Wyjaśnij, czym są **Progressive Web Apps (PWA)** i jak łączą zalety aplikacji webowych z funkcjami aplikacji mobilnych. Omów ich ograniczenia w porównaniu z natywnymi i hybrydowymi rozwiązaniami.

**Pytania kontrolne:**

1. Jakie cechy odróżniają PWA od klasycznych stron internetowych?
2. Jakie technologie umożliwiają działanie PWA w trybie offline i powiadomienia push?
3. Jakie ograniczenia mają PWA w dostępie do natywnych funkcji urządzenia?
4. W jakich zastosowaniach PWA może być lepszym wyborem niż aplikacja natywna?

**Wnioski:**
Progresywna aplikacja mobilna to nowoczesna technologia opracowana przez Google, która pozwala na tworzenie aplikacji internetowych o wysokiej jakości oraz działa jako aplikacja natywna. Użytkownik może korzystać z aplikacji bez konieczności instalowania jej na swoim urządzeniu. Zawiera w sobie funkcjonalności przeglądarki jak i aplikacji webowej. PWA wykorzystuje Service Worker, który zapisuje w cache pliki oraz dane, dzięki czemu aplikacja może działać offline. PWA posiada ograniczenia do natywnych API, bluetooth lub nfc jest ograniczone lub działa na wybranych przeglądarkach. PWA oferuje wiele zalet, dostępność offline, możliwość instalacji bezpośrednio z przeglądarki, szybsze ładowanie zasobów. Aplikacje takie jak Twitter Lite, Starbucks czy Pinterest korzystają z PWA. Są też niższe w kosztach utrzymania przez jedną bazę kodu dla wszystkich platform.

---

## Ćwiczenie 1 – React Native (React)

**Temat:** React Native: Field Notes

### Cel ćwiczenia

Stwórz podstawową aplikację mobilną w React Native (React), która wykorzystuje natywną funkcję urządzenia oraz komunikuje się z API. Aplikacja ma mieć 3–4 widoki.

### Opis projektu

"DoZrobienia" to aplikacja, w której możemy dodać własne zadania jakie chcemy wykonać, można je też usunąć, gdy uznamy, że je wykonaliśmy. Aplikacja posiada też API pobierające zdjęcia losowych psów ze strony, jest do tego osobny przycisk gdzie przechodzimy na ten widok. Posiada też widok z informacjami o wersji aplikacji

### Wymagania funkcjonalne

Środowisko React Native, emulator Android (Android Studio)

### Refleksja studenta

- **Jakie funkcje natywne zostały wykorzystane i dlaczego?**
  > Dodawanie i możliwość usuwania zadań
- **Jak zrealizowano komunikację z API?**
  > Poprzez zaimplementowanie klucza API do kodu ze strony, która generuje losowe zdjęcia psów
- **Jakie problemy napotkałeś przy konfiguracji lub uruchomieniu projektu?**
  > Źle skonfigurowane środowisko na samym początku zdecydowanie utrudniło rozpoczęcie pracy. Drobne błedy i literówki w kodzie
- **Jak oceniłbyś trudność zadania?**
  > Uważam to za zdecydowanie trudne zadanie

---

## Ćwiczenie 2 – Flutter (Dart)

**Temat:** Flutter: Geo Journal

### Cel ćwiczenia

Stwórz podstawową aplikację w Flutter (Dart) z natywną funkcją oraz komunikacją z API, zawierającą 3–4 widoki.

### Opis projektu

"Weather_app" aplikacja, która pokazuje aktualną pogodę na głównym ekranie, oraz możliwość sprawdzenia pogody w innych miastach

### Wymagania funkcjonalne

Środowisko Flutter, emulator Android (Android Studio)

### Refleksja studenta

- **Którą funkcję natywną wykorzystano i jak została zaimplementowana?**
  > … Pobieranie lokalizacji i danych pogodowych miast
- **Jak poradziłeś sobie z konfiguracją Flutter SDK?**
  > … Za pomocą strony docs.flutter.dev/get-started
- **Czy aplikacja działała poprawnie na emulatorze/urządzeniu?**
  > … U mnie działała poprawnie na emulatorze Android Studio
- **Co sprawiło największą trudność?**
  > … Dojście do momentu w, którym aplikacja zaczęła działać

---

## Ćwiczenie 3 – NativeScript (Angular)

**Temat:**

### Cel ćwiczenia

### Opis projektu

### Wymagania funkcjonalne

### Refleksja studenta

Zadanie było dla mnie za trudne i przez brak czasu nie mogłem go wykonać, jeśli będzie taka możliwość zrobię je w poźniejszym terminie.

- **Jakiej funkcji natywnej użyto i w jaki sposób została zaimplementowana?**
  >
- **Jak przebiegała integracja z API?**
  >
- **Jak oceniłbyś pracę z NativeScript i Angular w kontekście mobilnym?**
  >
- **Co chciałbyś ulepszyć w kolejnym projekcie?**
  >

---

## Podsumowanie

- **Które środowisko okazało się najłatwiejsze do konfiguracji?**
  >
- **Które najlepiej wspiera natywne funkcje urządzenia?**
  >
- **Które oferuje najbardziej intuicyjny model pracy z API?**
  >
- **Jakie wnioski wyciągnąłeś z porównania tych trzech frameworków?**
  >
