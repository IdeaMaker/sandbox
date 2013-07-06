<?php
namespace AdminModule;

use Nette\Caching\Cache;
use Nette\Caching\Storages\FileStorage;
use Nette\Diagnostics\Debugger;
use Nette\Environment;

class DashboardPresenter extends BasePresenter
{

	public function renderDefault()
	{
		$this->template->modules = array(
            'users' => array(
                'name' => 'Uživatelé',
                'icon' => '/web-icons/Users/user/user-64.png',
                'addUrl' => ':Admin:User:new',
                'listUrl' => ':Admin:User:default',
            ),
            'pages' => array(
                'name' => 'Stránky',
                'icon' => '/web-icons/Very_Basic/document/document-64.png',
                'addUrl' => ':Admin:StaticPage:new',
                'listUrl' => ':Admin:StaticPage:default',
            ),
//            'slideshow' => array(
//                'name' => 'Slideshow',
//                'icon' => '/web-icons/Very_Basic/picture/picture-64.png',
//                'addUrl' => ':Admin:StaticPage:new',
//                'listUrl' => ':Admin:StaticPage:default',
//            ),
        );
	}


}
