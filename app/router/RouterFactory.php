<?php

use Nette\Application\Routers\RouteList,
	Nette\Application\Routers\Route,
	Nette\Application\Routers\SimpleRouter;


/**
 * Router factory.
 */
class RouterFactory
{

    protected $languages = 'cs|en|de';
	/**
	 * @return Nette\Application\IRouter
	 */
	public function createRouter()
	{
		$router = new RouteList();
		$router[] = new Route('index.php', 'Homepage:default', Route::ONE_WAY);
        $router[] = new Route("/<module admin>/<presenter=Dashboard>/<action=default>[/<id>]", ':Admin:Dashboard:default');
        $router[] = new Route("/<lang=cs {$this->languages}>", 'Homepage:default');

        $router[] = new Route("/<lang=cs {$this->languages}>[/<parentSlug>][/<slug>/]", 'Homepage:static');
        $router[] = new Route("/<lang=cs {$this->languages}>/<presenter>/<action>[/<id>]", 'Homepage:default');
		return $router;
	}

}
