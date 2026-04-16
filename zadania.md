# Blok 1 — Data Visualization in R

## Zadanie 1 — Wczytanie danych i analiza eksploracyjna (EDA)

**Cel:**  
Zrozumienie struktury danych oraz przygotowanie podstawowych wizualizacji.

**Zadanie:**

1. Wczytaj plik `eco_measurements.csv` do środowiska R.  
2. Sprawdź strukturę danych (`str()`, `summary()`).  
3. Wygeneruj co najmniej:
   - 2 histogramy dla zmiennych numerycznych,  
   - 2 wykresy typu boxplot (np. zmienna numeryczna vs `habitat_type`),  
   - 1 wykres typu scatterplot (np. `height_cm` vs `leaf_area_cm2`).  
4. Wygeneruj jeden wykres typu `pairs()` dla minimum 4 wybranych zmiennych numerycznych.

**Wymagania techniczne:**
- Wszystkie wykresy zapisz jako pliki:
  - PNG (300 DPI),  
  - PDF (format wektorowy),  
  - TIFF (300 DPI, kompresja LZW),  
  - JPG (maksymalna jakość),  
  - BMP.  
- Użyj odpowiednich graphic devices (`png()`, `pdf()`, `tiff()`, `jpeg()`, `bmp()`).

**Wynik:**
- zestaw wykresów w różnych formatach,  
- porównanie:
  - wielkości plików,  
  - jakości przy powiększeniu (min. 400%).

---

## Zadanie 2 — Jedno pytanie biologiczne i dopasowanie wizualizacji

**Cel:**  
Dobór odpowiedniego typu wykresu do problemu biologicznego.

**Zadanie:**

1. Sformułuj jedno pytanie biologiczne na podstawie danych (np. wpływ siedliska na biomasę).  
2. Wybierz odpowiedni typ wykresu (boxplot, scatterplot, violin plot lub inny).  
3. Przygotuj jeden wykres odpowiadający na to pytanie.

**Wymagania techniczne:**
- Wykres wykonaj w `ggplot2`.  
- Zastosuj:
  - odpowiednie etykiety osi (`labs()`),  
  - legendę,  
  - temat (`theme_bw()` lub inny).  
- Zapisz wykres w formatach:
  - PDF (wektorowy),  
  - TIFF (300 DPI, LZW),  
  - PNG (300 DPI).  
- Ustaw rozmiar wykresu w jednostkach fizycznych (np. 180 mm szerokości).

**Wynik:**
- wykres w trzech formatach,  
- krótki opis (2–3 zdania), jakie ustawienia techniczne zostały zastosowane.

---

## Zadanie 3 — Wizualizacja wielowymiarowa (minimum 5 zmiennych)

**Cel:**  
Zastosowanie wielowymiarowego mapowania danych.

**Zadanie:**

Na podstawie `eco_measurements` przygotuj wykres, który wykorzystuje co najmniej 5 zmiennych, np.:

- oś X — zmienna numeryczna,  
- oś Y — zmienna numeryczna,  
- kolor — zmienna kategoryczna,  
- kształt — zmienna kategoryczna,  
- rozmiar punktu — zmienna numeryczna,  
- przezroczystość (alpha) — zmienna numeryczna lub dodatkowa,  
- faceting (opcjonalnie).

**Wymagania techniczne:**
- użyj `ggplot2`,  
- zastosuj co najmniej jeden element skalowania (`scale_*()`),  
- ustaw zakresy osi (`xlim()`, `ylim()` lub `coord_cartesian()`),  
- zastosuj kontrolę legendy (np. `guides()`).

**Eksport:**
- zapisz wykres jako:
  - PNG (300 DPI),  
  - TIFF (300 DPI, LZW),  
  - PDF.  

**Dodatkowo:**
- porównaj wpływ formatu pliku na:
  - czytelność szczegółów,  
  - odwzorowanie kolorów,  
  - wielkość pliku.

---

## Zadanie 4 — Przygotowanie figury zgodnej z wymaganiami czasopisma

**Cel:**  
Dostosowanie grafiki do wymagań publikacyjnych.

**Zadanie:**

1. Wybierz jedno czasopismo naukowe (np. IJMS, Nature, PLOS ONE).  
2. Sprawdź wymagania dotyczące grafiki (Instructions for Authors).  
3. Przygotuj wykres (np. PCA lub scatterplot), który spełnia wymagania:

- rozdzielczość (min. 300 DPI),  
- odpowiedni rozmiar (np. 85 mm lub 179 mm szerokości),  
- odpowiedni format (TIFF lub PDF),  
- przestrzeń kolorów (RGB),  
- kompresja LZW (dla TIFF).

**Wymagania techniczne:**
- użyj funkcji `tiff()` z parametrami:
  - `units = "mm"`,  
  - `res = 300`,  
  - `compression = "lzw"`.  
- wygeneruj również wersję:
  - PNG,  
  - PDF.

**Wynik:**
- zestaw plików graficznych,  
- porównanie parametrów technicznych i wielkości plików,  
- wskazanie różnic między formatami.

---

## Zadanie 5 — Figura wielopanelowa i porównanie formatów

**Cel:**  
Przygotowanie kompletnej figury oraz analiza wpływu formatu na jakość.

**Zadanie:**

1. Przygotuj cztery różne wykresy:
   - scatterplot,  
   - boxplot,  
   - histogram,  
   - PCA lub inny wykres wielowymiarowy.  
2. Połącz je w jedną figurę wielopanelową (A, B, C, D) przy użyciu:
   - `patchwork` lub `cowplot`.  

**Wymagania techniczne:**
- wszystkie panele muszą mieć:
  - spójną kolorystykę,  
  - czytelne etykiety,  
  - jednolity styl (theme).  
- dodaj oznaczenia paneli (A, B, C, D).  

**Eksport:**
- zapisz figurę jako:
  - PDF (wektorowy),  
  - TIFF (300 DPI, LZW),  
  - JPG,  
  - BMP.  

**Analiza:**
- porównaj:
  - jakość przy powiększeniu,  
  - wielkość plików,  
  - różnice między formatami rastrowymi i wektorowymi.  

**Wynik:**
- finalna figura wielopanelowa,  
- tabela porównawcza formatów (rozmiar pliku, jakość, zastosowanie).

--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------

# Blok 2 — Molecular Graphics in PyMOL

## Zadanie 6 — Podstawowa wizualizacja struktury białka

**Cel:**  
Opanowanie podstawowych operacji w PyMOL oraz przygotowanie czytelnej wizualizacji struktury.

**Zadanie:**

1. Załaduj strukturę białka z bazy PDB (np. `6KAP`).  
2. Ustaw reprezentacje:
   - białko → `cartoon`,  
   - ligand (np. HEM, CMO) → `sticks` lub `spheres`.  
3. Pokoloruj:
   - różne łańcuchy białka różnymi kolorami,  
   - ligand w sposób odróżniający go od białka.  
4. Ustaw tło na białe (`bg_color white`).  
5. Ustaw orientację struktury (`orient`).

**Wymagania techniczne:**
- użyj komend w linii poleceń PyMOL (command line),  
- zapisz sesję (`.pse`),  
- wykonaj render (`ray`) w rozdzielczości minimum 2000 × 2000 px.

**Eksport:**
- zapisz grafikę jako:
  - PNG (300 DPI),  
  - TIFF (300 DPI),  
  - JPG.

**Wynik:**
- zestaw grafik w różnych formatach,  
- porównanie jakości i wielkości plików.

---

## Zadanie 7 — Wizualizacja funkcjonalna (aktywne miejsce i ligand)

**Cel:**  
Podkreślenie znaczenia biologicznego struktury poprzez odpowiednią wizualizację.

**Zadanie:**

1. Na tej samej strukturze:
   - zaznacz ligand (`select resn HEM`, `select resn CMO`),  
   - zidentyfikuj i zaznacz reszty aminokwasowe w jego otoczeniu (np. w odległości 4–5 Å).  
2. Ustaw reprezentacje:
   - białko → cartoon,  
   - ligand → sticks lub spheres,  
   - reszty aktywne → sticks.  
3. Pokoloruj:
   - ligand według typu atomów (`util.cbag` lub ręcznie),  
   - reszty aktywne jednym kolorem kontrastowym.

**Wymagania techniczne:**
- użyj selekcji (`select`, `byres`, `within`),  
- ustaw odpowiednią grubość linii i promienie atomów (`set stick_radius`, `set sphere_scale`),  
- dostosuj widok (`zoom`, `orient`).

**Eksport:**
- PNG (300 DPI),  
- TIFF (300 DPI, jeśli dostępne),  
- JPG.

**Wynik:**
- grafika przedstawiająca funkcjonalny aspekt struktury,  
- krótki opis (2–3 zdania), co przedstawia wizualizacja.

---

## Zadanie 8 — Poprawa estetyki i rendering publikacyjny

**Cel:**  
Uzyskanie jakości publikacyjnej poprzez kontrolę parametrów renderingu.

**Zadanie:**

1. Przygotuj dwie wersje tej samej grafiki:
   - wersja domyślna (bez modyfikacji parametrów),  
   - wersja poprawiona (publication-ready).  

2. W wersji poprawionej zastosuj:
   - `set antialias, 2`,  
   - `set ambient`, `set direct`,  
   - `set specular`, `set shininess`,  
   - `set ray_shadows, 1`,  
   - `set ray_trace_gain`,  
   - opcjonalnie `set ray_opaque_background, off`.

3. Wykonaj render:
   - minimum 3000 × 3000 px (`ray 3000,3000`).

**Eksport:**
- PNG (300 DPI),  
- TIFF (jeśli możliwe),  
- JPG.

**Analiza:**
- porównaj:
  - ostrość krawędzi,  
  - kontrast,  
  - głębię obrazu,  
  - wielkość plików.

**Wynik:**
- dwa obrazy (default vs final),  
- krótki opis różnic.

---

## Zadanie 9 — Figura typu “storytelling” (komunikacja biologiczna)

**Cel:**  
Przygotowanie wizualizacji przekazującej konkretną informację biologiczną.

**Zadanie:**

1. Przygotuj grafikę przedstawiającą jedno zjawisko biologiczne, np.:
   - wiązanie ligandu,  
   - interakcję między cząsteczkami,  
   - fragment struktury odpowiedzialny za funkcję.  

2. Zastosuj:
   - różne reprezentacje (cartoon, sticks, surface),  
   - kontrastowe kolory,  
   - selektywne uproszczenie struktury (np. ukrycie części atomów).

3. Ustaw widok tak, aby najważniejszy element był centralny i dobrze widoczny.

**Wymagania techniczne:**
- użyj selekcji i maskowania (`hide`, `show`, `disable`),  
- ogranicz widok do istotnych elementów,  
- zachowaj czytelność grafiki.

**Eksport:**
- PNG (300 DPI),  
- TIFF (jeśli możliwe),  
- JPG.

**Wynik:**
- jedna figura,  
- krótki opis interpretacyjny (co przedstawia grafika i dlaczego).

---

## Zadanie 10 — Reproducible workflow (skrypt PyMOL)

**Cel:**  
Zapewnienie powtarzalności i automatyzacji procesu wizualizacji.

**Zadanie:**

1. Zapisz wszystkie kroki wizualizacji jako skrypt `.pml`, który:
   - pobiera strukturę (`fetch`),  
   - ustawia reprezentacje,  
   - definiuje kolory,  
   - ustawia parametry renderingu,  
   - wykonuje `ray`,  
   - zapisuje grafikę (`png`).  

2. Skrypt powinien działać bez użycia GUI (uruchomienie przez `@script.pml`).

**Wymagania techniczne:**
- użyj wyłącznie komend tekstowych PyMOL,  
- zachowaj kolejność operacji,  
- ustaw parametry renderingu w skrypcie.

**Eksport:**
- wygeneruj grafikę jako:
  - PNG (300 DPI),  
  - JPG.  

**Analiza:**
- uruchom skrypt ponownie i sprawdź, czy wynik jest identyczny,  
- porównaj wielkość plików w różnych formatach.

**Wynik:**
- plik `.pml`,  
- wygenerowane grafiki,  
- potwierdzenie powtarzalności wyniku.
