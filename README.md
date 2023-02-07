<h2> Divisão das pastas</h2>
todo se contra na paste lib: começando pelos
<h3> modelos: </h3> ai se contra o modelo utilizado para criar meu usuario dentro do banco de dados 
<h3>Providers: </h3> nessa pasata se encontram os documentos utilizados com Riverpod
<h3>Screens: </h3> estão todas como telas do aplicativo dividas por subpastas:
<h4>-login screen</h4> é a tela para fazer login 
<h4>-register sceen</h4> é a tela de catastro 
<h4>-edit user screen</h4> é a tela utiilizada para editar as informações dos usuarios já criados
<h4>user screen</h4> é a tela utilizada  para mostrar as informações do usuario
<h4>services</h4> é a pasta utilizada para consumir os serviços de Firestore e Firebase Storage
<h4>ui</h4> Nesta pasta estão meus widgets e clases personalizadas en quantos a UI
<h2>Tela de Login</h2>
Na tela de login vai se achar os campos de correo electrónico e senha, os quais o email esta tipado para que seja tipo email, é o campo de senha esta configurado para que seja maximo 7 caracteres esta permitido simbolos, números, letras. Tem um botão que permite ocultar / mostrar a senha. Embaixo da tela do login tem um link que da para a pagina de catastro.

<h2>Tela de catastro</h2>
Na tela catastro temos mais Fields os quais cada um esta tipado segundo seja o caso:
<h3> nome:</h3> permite nomes nomes com caracteres espereis tipo: jõao por exemplo, não esta permitido acabar o nome com espaço, mas, tem permitido colocar espaço entre palavras, por ejemplo é permitido: joão miguel
<h3> CPF </h3>esta tipado para que sejam só números y cada 3 números vai ser colocado de forma automática um ponto e tambem uma listra para que tenha a forma de cpf, tem permitido colocar 11 números. 
<h3>O campo tipo correio eletronico<h3> aceita só informação tipo correios.
<h3> O campo data de nascimento:</h3> esse campo esta criado para que sejam aceito datos validas tanto como dia, mes e ano tem que ter coerença 
<h3>O Campo da senha</h3> esta oculto mas tem um botão que da para ver a senha o cual tem uma pequena animação
validação
<br>
quem ja crio uma conta de usuario pode ingresar no login, mas se não tem alguma conta criada não vai poder ser logado no app
<h2>erro no login / catastro</h2>
Um problema esta acontecendo quando ingresamos, saimos e vamos para a pagina de catastro, e depois vamos a de login, aparece que as keys dos formularios não podem utilizadas ao mesmo tempo: "Múltiples widgets usaron el mismo GlobalKey." Não sei pq esta acontecendo esse erro, tentei divdir os keys por nome, o documento esta em proveedores / auth_form.dart ai está a logica que utilizei achando que ia solucionar.
<h2> Dificuldade com os documentos<h2>
Assim que o usuario consegue loggar ele vai para uma tela onde segundo os usuarios criados vão aparecer ai os emails (tipo uma conta admin), mas a dificuldade que aprensentei fue que não consegui retornar as informações de quem esteja sendo logado, precisei primeiro mostrar a lista de documentos e depois dai consigo filtrar as informações por usuario, a logica de esse segmento é encontrada na pagina 'home_page.dart' que esta en la pasta screens. Pienso que nessa parte do StreamBuilder teria que aplicar a logica para retornar só 1 mas não consegui por enquanto.
<h2>tela de autenticação</h2>
esta tela é a main_screen, filtra que fez login e quem não, quem não fez login manda ele pra login, e que esta logado manter ele dentro de home mesmo que feche o aplicativo.
<h2>Lista documentos [primeira tela depois do login, a screens/home_screens.dart]</h2>
nessa tela aparecem os emails de todos os usuarios cadastrados, se dar tap ele vai para otra tela onde mostra todas as informaçoes daquele usuario; se deixa puxado o tap acima da lista pode apagar o documento (não apaga a conta, simplesmente apaga os dados almacenados no banco de dados desse usuario)
<h2>Pagina de usuario [user_screen.dart/user_screen.dart]</h2>
Esta pagina esta dividida em 2 sections:

<h3>- Header, informações de usuario (bloco vermelho oscuro) e ListView [screens/user_screen.dart/user_screen]</h3>
Esse file contem um navbar o qual tem um icone que consigue logout da conta, embaixo disso tem a imagem de usuario, o nome de usuario e um icone que leva para editar as informações do usuario, também conten um ListView tipo carrousel de exemplo.
<h2>Dificuldade na tela de usuario [user_screen.dart]</h2>
O widget onde está no nome e na foto de perfil ele não é reconstruido assim que o nome é imagens são atualizado, 
eu tengo que atualizar o aplicativo para atualizar o nome e a imagem
<h2>- Icones na tela de usuarios [user_screen.dart]</h2>
Estes icones são personalizados o widget personalizado esta em ui/custom_icon.dart e são colocados em user_screen.dart com o nome CustomIcon 
<h1>Tela de editar usuarios [edit_user_screen.dart/edit_user.dart]</h1>
neste file vai estar o navbar com um arrow para fazer um back to lastscreen e embaixo as informações do usuario: imagem, cpf, nome, email, data de nascimento, mas só da para editar a imagem é o email. Se o usuarui não tem imagem de perfil vai aparecer uma imagem por default sinza de um user, e assim que ele colocasse uma imagem já vai aparecer nessa mesma tela, depois de salvar vai carregar a imagem para o banco de dados e vao ser mandado para a tela de usuario.
