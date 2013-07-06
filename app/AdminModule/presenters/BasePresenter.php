<?php
namespace AdminModule;
use Nette\Application\UI\Presenter;
use Nette\Caching\Cache;
use Nette\Diagnostics\Debugger;
use Nette\Environment;

/**
 * Base presenter for all application presenters.
 */
abstract class BasePresenter extends Presenter
{

    /**
     * @var
     * @persistent
     */
    public $lang;

    protected function startup()
    {
        parent::startup();

        if (!$this->getUser()->isLoggedIn()) {
            $this->redirect(':Admin:Sign:in');
        }
        $this->initLang();
    }

    protected function initLang()
    {
        if (!$this->lang)
            $this->lang = $this->context->parameters['default-lang'];

    }

    protected function beforeRender()
    {
        parent::beforeRender();
        $this->template->setTranslator(new \Grido\Translations\FileTranslator());
        $this->setLayout('admin');
        \Nette\Diagnostics\Debugger::barDump($_SESSION['__NF']['DATA']);
    }

    public function handleClearCache() {

        /**
         * @var Cache $cache
         */
        $cache = Environment::getCache('');
        $cache->clean(array(
            Cache::ALL => TRUE
        ));
        Debugger::barDump($cache);
        $this->flashMessage('Cache byla smazáná.');
        $this->redirect('this');
    }



}
