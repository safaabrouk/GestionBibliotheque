<header class="header">
			
		<!-- Top Bar -->
		<div class="top_bar">
			<div class="top_bar_container">
				<div class="container">
					<div class="row">
						<div class="col">
							<div class="top_bar_content d-flex flex-row align-items-center justify-content-start">
								<div class="top_bar_phone"><span class="top_bar_title">Téléphone:</span>+212 679 607 677</div>
								<div class="top_bar_right ml-auto">

									<!-- Language -->
									<div class="top_bar_lang">
										<span class="top_bar_title">language du site:</span>
										<ul class="lang_list">
											<li class="hassubs">
												<a href="#">Français<i class="fa fa-angle-down" aria-hidden="true"></i></a>
												<ul>
													<li><a href=<%=request.getContextPath()+"/accueil"%>>Anglais</a></li>
													<li><a href=<%=request.getContextPath()+"/accueil"%>>Japanese</a></li>
													<li><a href=<%=request.getContextPath()+"/accueil"%>>Lithuanian</a></li>
													<li><a href=<%=request.getContextPath()+"/accueil"%>>Swedish</a></li>
													<li><a href=<%=request.getContextPath()+"/accueil"%>>Italian</a></li>
												</ul>
											</li>
										</ul>
									</div>

									<!-- Social -->
									<div class="top_bar_social">
										<span class="top_bar_title social_title">Suivez-nous</span>
										<ul>
											<li><a href=<%=request.getContextPath()+"/accueil"%>><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
											<li><a href=<%=request.getContextPath()+"/accueil"%>><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
											<li><a href=<%=request.getContextPath()+"/accueil"%>><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>				
		</div>

		<!-- Header Content -->
		<div class="header_container">
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="header_content d-flex flex-row align-items-center justify-content-start">
							<div class="logo_container mr-auto">
								<a href=<%=request.getContextPath()+"/acceuil"%>>
									<div class="logo_text">ReadMore</div>
								</a>
							</div>
							<nav class="main_nav_contaner">
								<ul class="main_nav">
									<li ><a href=<%=request.getContextPath()+"/accueil"%>>Acceuil</a></li>
									<li><a href=<%=request.getContextPath()+"/nouveaute"%>>Nouveauté</a></li>
									<li><a href=<%=request.getContextPath()+"/apropos"%>>A propos de nous</a></li>
									<li><a href=<%=request.getContextPath()+"/livres"%>>Nos livres</a></li>
									<li><a href=<%=request.getContextPath()+"/contacter"%>>Contacter</a></li>
									<li><a href=<%=request.getContextPath()+"/inscription"%>>S'inscrire</a></li>
									<li><a href=<%=request.getContextPath()+"/authentification"%>>S'authentifier</a></li>
								</ul>
							</nav>
							<div class="header_content_right ml-auto text-right">
								

								<!-- Hamburger -->

								<div class="hamburger menu_mm">
									<i class="fa fa-bars menu_mm" aria-hidden="true"></i>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>

	</header>
	<div class="menu d-flex flex-column align-items-end justify-content-start text-right menu_mm trans_400">
		<div class="menu_close_container"><div class="menu_close"><div></div><div></div></div></div>
		<div class="search">
			<form action="#" class="header_search_form menu_mm">
				<input type="search" class="search_input menu_mm" placeholder="Search" required="required">
				<button class="header_search_button d-flex flex-column align-items-center justify-content-center menu_mm">
					<i class="fa fa-search menu_mm" aria-hidden="true"></i>
				</button>
			</form>
		</div>
		<nav class="menu_nav">
			<ul class="menu_mm">
				<li class="menu_mm"><a href=<%=request.getContextPath()+"/accueil"%>>Accueil</a></li>
				<li class="menu_mm"><a href=<%=request.getContextPath()+"/nouveaute"%>>Nouveauté</a></li>
				<li class="menu_mm"><a href=<%=request.getContextPath()+"/apropos"%>>A propos de nous</a></li>
				<li class="menu_mm"><a href=<%=request.getContextPath()+"/livres"%>>Nos livres</a></li>
				<li class="menu_mm"><a href=<%=request.getContextPath()+"/contacter"%>>Contacter</a></li>				
				<li class="menu_mm"><a href=<%=request.getContextPath()+"/inscription"%>>S'inscrire</a></li>
				<li class="menu_mm"><a href=<%=request.getContextPath()+"/authentification"%>>S'authentifier</a></li>
			</ul>
		</nav>
		<div class="menu_extra">
			<div class="menu_phone"><span class="menu_title">Téléphone:</span>+212 679 607 677</div>
			<div class="menu_social">
				<span class="menu_title">Suivez-nous</span>
				<ul>
					<li><a href=<%=request.getContextPath()+"/accueil"%>><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
					<li><a href=<%=request.getContextPath()+"/accueil"%>><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
					<li><a href=<%=request.getContextPath()+"/accueil"%>><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
				</ul>
			</div>
		</div>
	</div>