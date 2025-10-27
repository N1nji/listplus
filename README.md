# 📝 ListPlus — Gerencie suas listas com praticidade

Um aplicativo que desenvolvi em Flutter como parte de um Desafio Técnico iOS Júnior, com foco em organização, boas práticas e UX.  
O ListPlus permite criar, concluir e remover itens facilmente, com dados salvos localmente e uma interface fluida e moderna.  

____

## Preview

| Modo Claro                                
| ---------------------------------         
| ![Light](/assets/listplus_light.gif)  

____

| Modo Escuro
| ---------------------------------
| ![Dark](/assets/listplus_dark.gif)  
____

##  Funcionalidades

✅ Exibir uma lista de itens com título e data de criação  
✅ Adicionar e remover itens  
✅ Marcar itens como concluídos  
✅ Salvar dados localmente (SharedPreferences)  
✅ Ordenar por data (mais recentes / mais antigos)  
✅ Layout adaptável e responsivo  
✅ Animações suaves ao adicionar/remover  
✅ Tema moderno com modo claro e escuro automático  

## Arquitetura  

Aplicativo que desenvolvi com o padrão MVVM (Model-View-ViewModel), utilizando:  

Provider para gerenciamento de estado  
SharedPreferences para persistência de dados local  
Separação clara entre Models, ViewModels, Views e Widgets reutilizáveis  

## Estrutura do Projeto

lib/  
 ├─ models/  
 │   └─ todo_item.dart  
 ├─ viewmodels/  
 │   └─ todo_view_model.dart  
 ├─ views/  
 │   └─ todo_list_page.dart  
 ├─ widgets/  
 │   └─ todo_tile.dart  
 ├─ main.dart  

____

##  Como rodar o projeto?

1. Clone o repositório:
   ```bash
   git clone https://github.com/N1nji/listplus.git

2. Entre na pasta:
    ```bash
    cd listplus

3. Instale as dependências:
    ```bash
    flutter pub get

4. Rode o app:
    ```bash
    flutter run
____

##  Tecnologias Utilizadas

Flutter 3.24+  
Dart  
Provider  
SharedPreferences  
Material 3  

## 📋 Lista de Tarefas

✅ Criei a estrutura base do projeto  
✅ Implementei adição e remoção de itens  
✅ Opção de marcar itens como concluídos  
✅ Persistir dados localmente  
✅ Ordenar itens por data  
✅ Adicionei animações suaves  
✅ Implementei modo claro/escuro automático  
✅ Criei README e gravação de preview  


## Decisão técnica

Por estar em um ambiente Windows, não foi possível executar o Xcode ou Swift nativamente.
Por isso, optei por implementar em Flutter, garantindo a entrega funcional e aplicando os mesmos princípios de arquitetura e boas práticas que seriam usados em Swift.

Essa abordagem permitiu manter o foco na lógica, experiência do usuário e estrutura de código, que são os principais pontos avaliados no desafio.

____

## Autor

Pedro Felipe (N1nji)
💼 Desenvolvedor Flutter | Desafio iOS Developer  
📧 Meu Site: https://portfolio-n1nji.vercel.app  

🌐 github.com/N1nji