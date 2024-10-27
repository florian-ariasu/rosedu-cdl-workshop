# Linkare dinamică

Linkarea dinamică înseamnă că în executabil nu sunt incluse componentele folosite din bibliotecă.
Acestea vor fi incluse mai târziu, la încărcare (*load time*) sau chiar la rulare (*runtime).
În urma linkării dinamice, executabilul reține referințe la bibliotecile folosite și la simbolurile folosite din cadrul acestora.
Aceste referințe sunt similare unor simboluri nedefinite.
Rezolvarea acestor simboluri are loc mai târziu, prin folosirea unui loader / linker dinamic.

Așadar, în cazul linkării dinamice, aspecte precum rezolvarea simbolurilor sau stabilirea adreselor nu sunt efectuate pentru simbolurile bibliotecilor.

În directorul `06-dynamic/` avem un conținut similar directorului `05-static/`.
Diferența este că acum, folosim linkare dinamică în loc de linkare statică pentru biblioteca standard C.
Pentru aceasta, am renunțat la argumentul `-static` folosit la linkare.

Pentru acest exemplu, obținem un singur executabil `main`, din legarea statică cu biblioteca `libinc.a` și legarea dinamică cu biblioteca standard C.
Similar exemplului din directorul `05-static/, folosim comanda `make` pentru a obține executabilul `main`:

```console
[..]/06-dynamic$ ls
inc.c  inc.h  main.c  Makefile

[..]/06-dynamic$ make
cc -fno-PIC -m32   -c -o main.o main.c
cc -fno-PIC -m32   -c -o inc.o inc.c
ar rc libinc.a inc.o
cc -no-pie -m32 -L. -o main main.o -linc

[..]/06-dynamic$ ls
inc.c  inc.h  inc.o  libinc.a  main  main.c  main.o  Makefile

[..]/06-dynamic$ ls -l main
-rwxr-xr-x 1 razvan razvan 7272 Jan 17 17:42 main

[..]/06-dynamic$ ./main
num_items: 1

[..]/06-dynamic$ file main
main: ELF 32-bit LSB executable, Intel 80386, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux.so.2, for GNU/Linux 3.2.0, BuildID[sha1]=8d99d4600dc70919266f4063da1eaf8ff9ce96e1, not stripped

[..]/06-dynamic$ file ../05-static/main
../05-static/main: ELF 32-bit LSB executable, Intel 80386, version 1 (GNU/Linux), statically linked, for GNU/Linux 3.2.0, BuildID[sha1]=60adf8390374c898998c0b713a8b1ea0c255af38, not stripped
``

Fișierul executabil `main` obținut prin linkare dinamică are un comportament identic fișierului executabil `main` obținut prin linkare statică.
Observăm că dimensiunea sa este mult mai redusă: ocupă `7 KB` comparativ cu `600 KB` cât avea varianta sa statică.
De asemenea, folosind utilitarul `file`, aflăm că este executabil obținut prin linkare dinamică (*dynamically linked*), în vreme cel obținut în exemplul anterior este executabil obținut prin linkare statică (*statically linked).

Investigăm simbolurile executabilului:

```console
[..]/06-dynamic$ nm main
[...]
0804848c T increment
0804847c T init
[...]
         U __libc_start_main@@GLIBC_2.0
08048446 T main
0804a020 b num_items
080484a9 T print
         U printf@@GLIBC_2.0
0804849f T read
[...]
08048330 T _start
[...]
```

Simbolurile obținute din modulul obiect `main.o` și din biblioteca statică `libinc.o` sunt rezolvate și au adrese stabilite.
Observăm că folosirea bibliotecii standard C a dus la existența simboblului `_start`, care este entry pointul programului.
Dar, simbolurile din biblioteca standard C, (`printf`, __libc_start_main`) sunt marcate ca nedefinite (`U`).
Aceste simboluri nu sunt prezente în executabil: rezolvarea, stabilirea adreselor și relocarea lor se va realiza mai târziu, la încărcare (load time).

La încărcare, o altă componentă software a sistemului, loaderul / linkerul dinamic, se va ocupa de:

- localizarea în sistemul de fișiere a fișierelor bibliotecă dinamice care sunt folosite de fișierul executabil încărcat
- încărcarea în memorie a acelor biblioteci dinamice, lucru care duce și la stabilirea adreselor simbolurilor din bibliotecă
- parcurgerea simbolurilor nedefinite din cadrul fișierului executabil, localizarea lor în biblioteca înacarcată dinamic și relocarea lor în executabilul încărcat în memorie

Putem investiga bibliotecile dinamice folosite de un executabil prin intermediul utilitarului `ldd`:

``console
[..]/06-dynamic$ ldd main
	linux-gate.so.1 (0xf7f97000)
	libc.so.6 => /lib/i386-linux-gnu/libc.so.6 (0xf7d8a000)
	/lib/ld-linux.so.2 (0xf7f98000)
```

În rezultatul de mai sus, observăm că executabilul folosește biblioteca standard C, localizată la calea `/lib/i386-linux-gnu/libc.so.6`.
`/lib/ld-linux.so.2` este loaderul / linkerul dinamic.
`linux-gate.so.1` e o componentă specifică Linux pe care nu vom insista.

Pe lângă dimensiunea redusă a executabilelor, marele avantaj al folosirii linkării dinamice, este că se pot partaja secțiunile de cod (nu de date) ale bibliotecilor dinamice.
Când un executabil dinamic este încărcat, se identifică bibliotecile dinamice de care acesta depinde.
Dacă o bibliotecă dinamică deja există în memorie, se face referire direct la zona existentă, partajând astfel biblioteca dinamică.
Acest lucru conduce la o reducere semnificativă a memoriei ocupate de aplicațiile sistemului.
10 aplicații care folosesc, probabil toate, biblioteca standard C, vor partaja codul bibliotecii.

Din acest motiv, bibliotecile dinamice mai sunt numite și obiecte partajate (*shared objects*).
De aici este, în Linux, extensia `.so` a fișierelor de tip bibliotecă partajată.

## Biblioteci cu linkare dinamică

Numele corect al unei biblioteci dinamice este bibliotecă cu linkare dinamică (*dynamically linked library*) sau bibliotecă partajată.
În Windows, bibliotecile dinamice sunt numite *dynamic-link libraries* de unde și extensia `.dll`.

Din punctul de vedere al comenzii folosite, nu diferă linkarea unei biblioteci dinamice sau a unei biblioci statice.
Diferă executabilul obținut, care va avea nedefinite simbolurile folosite din bibliotecile dinamice.
De asemenea, loaderul / linkerul dinamic trebuie să fie informat de locul bibliotecii dinamice.

În directorul `07-dynlib/` avem un conținut similar directorului `06-dynamic/`.
Diferența este că acum, folosim linkare dinamică în loc de linkare statică și pentru a include funcționalitatea `inc.c`, nu doar pentru biblioteca standard C.
Pentru aceasta, construim fișierul bibliotecă partajată `libinc.so`, în locul fișierului bibliotecă statică `libibc.a`.

Similar exemplului din directorul `06-dynamic/`, folosim comanda `make` pentru a obține executabilul `main`:

```console
[..]/07-dynlib$ ls
inc.c  inc.h  main.c  Makefile

[..]/07-dynlib$ make
cc -fno-PIC -m32   -c -o main.o main.c
cc -fno-PIC -m32   -c -o inc.o inc.c
cc -m32 -shared -o libinc.so inc.o
cc -no-pie -m32 -L. -o main main.o -linc

[..]/07-dynlib$ ls
inc.c  inc.h  inc.o  libinc.so  main  main.c  main.o  Makefile

[..]/07-dynlib$ ls -l main
-rwxr-xr-x 1 razvan razvan 7200 Jan 17 18:11 main

[..]/07-dynlib$ nm main
[...]
         U increment
         U init
080483ac T _init
[...]
         U __libc_start_main@@GLIBC_2.0
08048556 T main
         U print
         U read
[...]
08048440 T _start
```

Executabilul obținut are dimensiunea în jur de `7 KB` puțin mai mică decât a executabilului din exemplul anterior.
Diferența cea mai mare este că, acum, simbolurile din biblioteca `libinc.so` (`increment`, `init`, `print`, `read`) sunt nerezolvate.

Dacă încercăm lansarea în execuție a executabilului, observăm că primim o eroare:

```console
[..]/07-dynlib$ ./main
./main: error while loading shared libraries: libinc.so: cannot open shared object file: No such file or directory
```

Eroarea spune că nu poate localiza biblioteca `libinc.so` la încărcare (*loading*).
Este deci, o eroare de loader.

O eroare similară obținem dacă folosim utilitarul `ldd`:

```console
[..]/07-dynlib$ ldd ./main
	linux-gate.so.1 (0xf7f9f000)
	libinc.so => not found
	libc.so.6 => /lib/i386-linux-gnu/libc.so.6 (0xf7d92000)
	/lib/ld-linux.so.2 (0xf7fa0000)
```

La fel, biblioteca `libinc.so` nu este găsită.

Motivul este că nu am precizat loaderului unde să caute biblioteca partajată.
Loaderul are definită calea unde să caute biblioteca standard C (`/lib/i386-linux-gnu/libc.so.6`), dar nu deține informații despre `libinc.so`.

Ca să precizăm loaderului calea către bibliotecă, o cale simplă, de test, este folosirea variabilei de mediu `LD_LIBRARY_PATH`, pe care o inițializăm la directorul curent (`.` - *dot*).
Odată folosită variabila de mediu `LD_LIBRARY_PATH`, lansarea în execuție a executabilului va funcționa, la fel și folosirea `ldd`:

```console
[..]/07-dynlib$ LD_LIBRARY_PATH=. ldd ./main
	linux-gate.so.1 (0xf7eda000)
	libinc.so => ./libinc.so (0xf7ed2000)
	libc.so.6 => /lib/i386-linux-gnu/libc.so.6 (0xf7cca000)
	/lib/ld-linux.so.2 (0xf7edb000)

[..]/07-dynlib$ LD_LIBRARY_PATH=. ./main
num_items: 1
```

Variabila de mediu `LD_LIBRARY_PATH` pentru loader este echivalentul opțiunii `-L` în comanda de linkare: precizează directoarele în care să fie căutate biblioteci pentru a fi încărcate, respectiv linkate.
Folosirea variabilei de mediu `LD_LIBRARY_PATH` este recomandată pentru teste.
Pentru o folosire robustă, există alte mijloace de precizare a căilor de căutare a bibliotecilor partajate, documentate în (pagina de manual a loaderului / linkerului dinamic)(https://man7.org/linux/man-pages/man8/ld.so.8.html#DESCRIPTION).
