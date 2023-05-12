
Sobre
Aplicativo criado para estudos e praticas.

O projeto foi desenvolvido utilizando a linguagem Dart e o framework Flutter, seguindo os princípios do SOLID e Clean Architecture. Foram utilizados os pacotes ValueNotifier, Get It e Dio.

O aplicativo consiste em uma tela de login que utiliza a plataforma do Firebase para realizar o login e cadastro dos usuários. Após o login, o usuário é direcionado para a tela inicial, que consome uma API e exibe uma lista de itens, permitindo as operações de CRUD.

Tecnologias Utilizadas:
Dart
Flutter
Firebase
Get It
Dio
O projeto foi desenvolvido utilizando a arquitetura Clean Architecture, que tem como objetivo separar as responsabilidades do projeto em camadas, facilitando a manutenção e testabilidade do código.

As camadas utilizadas no projeto foram:

Presentation
Domain
Data
A camada de Presentation é responsável pela interface do usuário, incluindo as telas e widgets do aplicativo.

A camada de Domain contém as regras de negócio da aplicação, as interfaces dos repositórios e os modelos de dados.

A camada de Data é responsável pelo acesso aos dados, incluindo a implementação dos repositórios e a comunicação com as APIs.

Princípios Utilizados:
O projeto segue os princípios do SOLID (Single Responsibility Principle, Open/Closed Principle, Liskov Substitution Principle, Interface Segregation Principle, Dependency Inversion Principle), que são considerados boas práticas de desenvolvimento de software.

Pacotes Utilizados:
ValueNotifier
O pacote ValueNotifier é utilizado para atualizar a interface do usuário quando há mudanças nos dados do aplicativo.

Get It
O pacote Get It é utilizado para gerenciamento de dependências.

Dio
O pacote Dio é utilizado para comunicação com APIs.

Como Instalar
Realizar o clone do projeto e atualizar o key API do Firebase.
