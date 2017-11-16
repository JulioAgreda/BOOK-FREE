<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Inicio.aspx.cs" Inherits="Inicio" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>BookFree</title>

</head>
<body>
    <br />
    <br /> 
    <div class="wrapper">
	    <div class="sidebar" data-color="purple" >

			<!--
		        Tip 1: You can change the color of the sidebar using: data-color="purple | blue | green | orange | red"

		        Tip 2: you can also add an image using data-image tag
		    -->

<section class="navbar navbar-fixed-top custom-navbar" role="navigation">
	<div class="container">
		<div class="navbar-header">
			    <button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
				    <span class="icon icon-bar"></span>
				    <span class="icon icon-bar"></span>
				    <span class="icon icon-bar"></span>
			    </button>
			<a href="#" class="navbar-brand">Digital Team</a>
		</div>
		<div class="collapse navbar-collapse">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#home" class="smoothScroll">HOME</a></li>
				<li><a href="#work" class="smoothScroll">WORK</a></li>
				<li><a href="#about" class="smoothScroll">ABOUT</a></li>
				<li><a href="#team" class="smoothScroll">TEAM</a></li>
				<li><a href="#portfolio" class="smoothScroll">PORTFOLIO</a></li>
				<li><a href="#pricing" class="smoothScroll">PRICING</a></li>
				<li><a href="#contact" class="smoothScroll">CONTACT</a></li>
			</ul>
		</div>
	</div>
</section>


<section id="home">
	<div class="container">
		<div class="row">
			<div class="col-md-12 col-sm-12">				
                <h1>BOOKFREE</h1>
                <h3>Nunca deje de crecer</h3>                
				<hr>
				<a id="btnIngresa" href="Usuarios/FormularioUsuario.aspx" class="smoothScroll btn btn-success">Ingresa</a>
			</div>
		</div>
	</div>		
</section>

 <br />
 <br />

  <section class="booklist">
    <h2>Los 10 libros más descargados</h2>
    <a class="more" href="/es/books/topdownloads">Ver todos</a>
    <div class="row">
        <div class="book">
  <span class="book__number">1</span>
  <p class="book__title"><a href="/es/books/la-dicha-incierta-del-amor">La Dicha Incierta del Amor</a></p>
  <p class="book__author"><a href="/es/books/filter-author/em-ariza">EM Ariza</a></p>
  <ul class="book__links">
    <li><a href="/es/books/la-dicha-incierta-del-amor"><span class="material-icons">&#xE2C4;</span> Descargar</a></li>
    <li>
      <a href="javascript:void(0);" onclick="return jsFunction(&#x27;/es/books/la-dicha-incierta-del-amor/readonline&#x27;,51556,false)">
          <span class="material-icons">&#xE8D2;</span> Leer en línea
</a>    </li>
    <li>
      <div class="share16">
  <a class="btn-share16" href="#"><span class="material-icons">&#xE80D;</span> Compartir</a>
  <div class="card__share hide">
    <a target="_blank" href="https://twitter.com/intent/tweet?text=La%20Dicha%20Incierta%20del%20Amor%20EM%20Ariza%20%23freeditorial%20%23ebook&url=https://freeditorial.com/es/books/la-dicha-incierta-del-amor"><span class="icon icon__twitter">Twitter</span></a>
    <a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=https://freeditorial.com/es/books/la-dicha-incierta-del-amor"><span class="icon icon__facebook">Facebook</span></a>
    <a href="/es/books/la-dicha-incierta-del-amor/sendbook"><span class="icon icon__other">Other</span></a>
  </div>
</div>
    </li>
  </ul>
</div><!-- .book -->

        <div class="book">
  <span class="book__number">2</span>
  <p class="book__title"><a href="/es/books/idioteces-de-los-idiotas-y-otras-tonterias">Idioteces de los idiotas, y otras tonterías…</a></p>
  <p class="book__author"><a href="/es/books/filter-author/em-ariza">EM Ariza</a></p>
  <ul class="book__links">
    <li><a href="/es/books/idioteces-de-los-idiotas-y-otras-tonterias"><span class="material-icons">&#xE2C4;</span> Descargar</a></li>
    <li>
      <a href="javascript:void(0);" onclick="return jsFunction(&#x27;/es/books/idioteces-de-los-idiotas-y-otras-tonterias/readonline&#x27;,52156,false)">
          <span class="material-icons">&#xE8D2;</span> Leer en línea
</a>    </li>
    <li>
      <div class="share16">
  <a class="btn-share16" href="#"><span class="material-icons">&#xE80D;</span> Compartir</a>
  <div class="card__share hide">
    <a target="_blank" href="https://twitter.com/intent/tweet?text=Idioteces%20de%20los%20idiotas%2C%20y%20otras%20tonter%C3%ADas%E2%80%A6%20EM%20Ariza%20%23freeditorial%20%23ebook&url=https://freeditorial.com/es/books/idioteces-de-los-idiotas-y-otras-tonterias"><span class="icon icon__twitter">Twitter</span></a>
    <a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=https://freeditorial.com/es/books/idioteces-de-los-idiotas-y-otras-tonterias"><span class="icon icon__facebook">Facebook</span></a>
    <a href="/es/books/idioteces-de-los-idiotas-y-otras-tonterias/sendbook"><span class="icon icon__other">Other</span></a>
  </div>
</div>
    </li>
  </ul>
</div><!-- .book -->

        <div class="book">
  <span class="book__number">3</span>
  <p class="book__title"><a href="/es/books/la-economia-de-la-abundancia-o-el-fin-de-la-pobreza">La Economía de la Abundancia o el Fin de...</a></p>
  <p class="book__author"><a href="/es/books/filter-author/victor-saltero">Victor Saltero</a></p>
  <ul class="book__links">
    <li><a href="/es/books/la-economia-de-la-abundancia-o-el-fin-de-la-pobreza"><span class="material-icons">&#xE2C4;</span> Descargar</a></li>
    <li>
      <a href="javascript:void(0);" onclick="return jsFunction(&#x27;/es/books/la-economia-de-la-abundancia-o-el-fin-de-la-pobreza/readonline&#x27;,52386,false)">
          <span class="material-icons">&#xE8D2;</span> Leer en línea
</a>    </li>
    <li>
      <div class="share16">
  <a class="btn-share16" href="#"><span class="material-icons">&#xE80D;</span> Compartir</a>
  <div class="card__share hide">
    <a target="_blank" href="https://twitter.com/intent/tweet?text=La%20Econom%C3%ADa%20de%20la%20Abundancia%20o%20el%20Fin%20de%20la%20Pobreza%20Victor%20Saltero%20%23freeditorial%20%23ebook&url=https://freeditorial.com/es/books/la-economia-de-la-abundancia-o-el-fin-de-la-pobreza"><span class="icon icon__twitter">Twitter</span></a>
    <a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=https://freeditorial.com/es/books/la-economia-de-la-abundancia-o-el-fin-de-la-pobreza"><span class="icon icon__facebook">Facebook</span></a>
    <a href="/es/books/la-economia-de-la-abundancia-o-el-fin-de-la-pobreza/sendbook"><span class="icon icon__other">Other</span></a>
  </div>
</div>
    </li>
  </ul>
</div><!-- .book -->

        <div class="book">
  <span class="book__number">4</span>
  <p class="book__title"><a href="/es/books/el-fantasma-de-la-opera">El Fantasma de la Ópera</a></p>
  <p class="book__author"><a href="/es/books/filter-author/gaston-leroux--5"> Gaston Leroux</a></p>
  <ul class="book__links">
    <li><a href="/es/books/el-fantasma-de-la-opera"><span class="material-icons">&#xE2C4;</span> Descargar</a></li>
    <li>
      <a href="javascript:void(0);" onclick="return jsFunction(&#x27;/es/books/el-fantasma-de-la-opera/readonline&#x27;,52401,false)">
          <span class="material-icons">&#xE8D2;</span> Leer en línea
</a>    </li>
    <li>
      <div class="share16">
  <a class="btn-share16" href="#"><span class="material-icons">&#xE80D;</span> Compartir</a>
  <div class="card__share hide">
    <a target="_blank" href="https://twitter.com/intent/tweet?text=El%20Fantasma%20de%20la%20%C3%93pera%20%20Gaston%20Leroux%20%23freeditorial%20%23ebook&url=https://freeditorial.com/es/books/el-fantasma-de-la-opera"><span class="icon icon__twitter">Twitter</span></a>
    <a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=https://freeditorial.com/es/books/el-fantasma-de-la-opera"><span class="icon icon__facebook">Facebook</span></a>
    <a href="/es/books/el-fantasma-de-la-opera/sendbook"><span class="icon icon__other">Other</span></a>
  </div>
</div>
    </li>
  </ul>
</div><!-- .book -->

        <div class="book">
  <span class="book__number">5</span>
  <p class="book__title"><a href="/es/books/un-plan-para-tres">Un Plan Para Tres</a></p>
  <p class="book__author"><a href="/es/books/filter-author/j-l-tormo">J.L. Tormo</a></p>
  <ul class="book__links">
    <li><a href="/es/books/un-plan-para-tres"><span class="material-icons">&#xE2C4;</span> Descargar</a></li>
    <li>
      <a href="javascript:void(0);" onclick="return jsFunction(&#x27;/es/books/un-plan-para-tres/readonline&#x27;,52340,false)">
          <span class="material-icons">&#xE8D2;</span> Leer en línea
</a>    </li>
    <li>
      <div class="share16">
  <a class="btn-share16" href="#"><span class="material-icons">&#xE80D;</span> Compartir</a>
  <div class="card__share hide">
    <a target="_blank" href="https://twitter.com/intent/tweet?text=Un%20Plan%20Para%20Tres%20J.L.%20Tormo%20%23freeditorial%20%23ebook&url=https://freeditorial.com/es/books/un-plan-para-tres"><span class="icon icon__twitter">Twitter</span></a>
    <a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=https://freeditorial.com/es/books/un-plan-para-tres"><span class="icon icon__facebook">Facebook</span></a>
    <a href="/es/books/un-plan-para-tres/sendbook"><span class="icon icon__other">Other</span></a>
  </div>
</div>
    </li>
  </ul>
</div><!-- .book -->

    </div>
  </section><!-- .booklist -->



<section id="work">
	<div class="container">
		<div class="row">			
			<div class="col-lg-4 col-md-4 col-sm-4 wow fadeInUp" data-wow-delay="0.6s">
				<i class="icon-cloud medium-icon"></i>
					<h3>Stephen King</h3>
					<hr>
					<p>King capta la magia de la infancia y eleva el espíritu del lector con su representación del poder protector de la amistad frente al mal para un grupo de niños de la escuela primaria. </p>
			</div>
			<div class="col-lg-4 col-md-4 col-sm-4 wow fadeInUp" data-wow-delay="0.9s">
				<i class="icon-mobile medium-icon"></i>
					<h3>Todas las chicas desaparecidas</h3>
					<hr>
					<p>Una revisión del libro del New York Times "Elección de los editores" 
                        Entretenimiento semanal - Thriller Round-Up 
                        The Wall Street Journal - 5 Libros asesinos para 2016 
                        Hollywood Reporter - Libros calientes ... 16 Debe ... .</p>
			</div>
			<div class="col-lg-4 col-md-4 col-sm-4 wow fadeInUp" data-wow-delay="1s">
				<i class="icon-laptop medium-icon"></i>
					<h3>Breve historia de la humanidad</h3>
					<hr>
					<p>El trabajo seminal del Dr. Harari combina la ciencia con la historia para dar una saga completa de la especie humana. .</p>
			</div>						
		</div>
	</div>
</section>

</body>
</html>
