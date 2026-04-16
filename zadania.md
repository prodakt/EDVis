# Blok 1 — Data Visualization in R

---

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
