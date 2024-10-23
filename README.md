# test-oi

:white_check_mark: Skrypt do testowania rozwiązań na Olimpiadę Informatyczną

## Korzystanie ze skryptu

1. Pobierz skrypt

    - ręcznie - klikając w [link](https://raw.githubusercontent.com/bartekl1/test-oi/refs/heads/main/test.sh)
    - za pomocą `wget`

        ```bash
        wget https://raw.githubusercontent.com/bartekl1/test-oi/refs/heads/main/test.sh
        ```

2. Przygotuj rozwiązanie w C++, a następnie je skompiluj.

    Przykładowe polecenie kompilacji:

    ```bash
    g++ program.cpp -o program -static
    ```

3. Przygotuj folder z testami.

    Każdy test powinien składać się z dwóch plików - pliku wejścia i pliku wyjścia. Plik wejścia powinien mieć rozszerzenie `.in`, a wyjścia `.out`, nazwa obu plików powinna być taka sama.

    W folderze z testami nie powinny znajdować się inne pliki niż testy dla jednego rozwiązania.

4. Uruchom skrypt

    Składnia:

    ```bash
    test.sh <exe_path> <tests_path>
    ```

    - `<exe_path>` - ścieżka do skompilowanego rozwiązania

    - `<test_path>` - ścieżka do folderu z testami

5. Skrypt wyświetli wynik dla każdego testu od razu po jego wykonaniu. Po wykonaniu wszystkich testów skrypt wyświetli liczbę testów pozytywnych, całkowitą liczbę testów oraz wynik procentowy. Jeśli wszystkie testy będą pozytywne program zakończy swoje działanie z kodem `0`, w przeciwnym razie z kodem `1`. Aby przerwać testowanie należy nacisnąć <kbd>Ctrl</kbd> + <kbd>C</kbd>, w przypadku przerwania skrypt wyświetli wynik dla wykonanych testów.
