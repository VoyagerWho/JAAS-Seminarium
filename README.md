# ZTI Seminarium: Java Authentication and Authorization Services

## Paweł Bielecki

## Sławomir Klimowski

## Wstęp

### Przykład aplikacji wykorzystującej moduł JAAS w celu ograniczenia dostępu do zasobów serwera

W ramach demo przygotowana została prosta aplikacja w React.js, do której dostęp udzielony jest wyłącznie po prawidłowym zalogowaniu się. \
Dodatkowo przygotowany został zasób dostępny tylko dla wybranej roli. \
Przykład opracowany został na serwerze TomEE w środowisku IntelliJ IDEA

Lista zasobów wraz z adresami:

- Aplikacja React: /%CONTEXT%/
- Panel Admin: /%CONTEXT%/Admin.jsp

%CONTEXT% - adres, na którym serwer TomEE udostępnia aplikację \
W naszym przykładzie %CONTEXT% = JAAS-Seminarium-1.0-SNAPSHOT, co daje odpowiednio:

- Aplikacja React: /JAAS-Seminarium-1.0-SNAPSHOT/
- Panel Admin: /JAAS-Seminarium-1.0-SNAPSHOT/Admin.jsp

## Uruchomienie

W celu uruchomienia aplikacji lokalnie można skorzystać z narzędzia tworzącego projekt na podstawie repozytorium.

Następnie wystarczy przenieść plik jaas.config do katalogu conf serwera TomEE \
lub zedytowanie flagi JVM:
-Djava.security.auth.login.config="$CATALINA_BASE/conf/jaas.config" \
tak, aby posiadała absolutną lokalizację pliku jaas.config

## Użytkownicy

Login: dowolny -> rola User (admin -> rola Admin) \
Hasło: pass
