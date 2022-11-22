
# Flutter GBX
Flutter GBX is a collection of packages to help development of 
a scalable clean code app in flutter.

## packages
#### gbx_core
gbx_core as the name implies, is the core of flutter_gbx, it contains
the definition of use cases, repositories, a few widgets and commonly
used type extensions.  
[Documentation](https://github.com/GB0307/flutter_gbx/tree/main/gbx_core)  

#### gbx_di
gbx_di is a dependency injection "abstraction" package, by default, it
uses [get_it](https://pub.dev/packages/get_it) under the hood, but you
can replace it with any other dependency injection package or your own
implementation withou having to change anything else in your code.  
[Documentation](https://github.com/GB0307/flutter_gbx/tree/main/gbx_di)  

#### gbx_bloc
gbx_bloc contains helpers and base blocs to be used in your applications,
one example is the "DataBloc", which can handle most data operation events
(fetch, set, update, clean, fetch_more and refresh) while handling loading
and errors automaticaly.
[Documentation](https://github.com/GB0307/flutter_gbx/tree/main/gbx_bloc)  
