<?php

/**
 * Base presenter for all application presenters.
 */
abstract class BasePresenter extends Nette\Application\UI\Presenter
{
    /** @persistent */
    public $lang = 'cs';









    /** @var \Kollarovic\Thumbnail\AbstractGenerator */
    protected $thumbnailGenerator;


    public function injectThumbnail(\Kollarovic\Thumbnail\AbstractGenerator $thumbnailGenerator)
    {
        $this->thumbnailGenerator = $thumbnailGenerator;
    }


    protected function createTemplate($class = NULL)
    {
        $template = parent::createTemplate($class);
        $template->registerHelper('thumbnail', $this->thumbnailGenerator->thumbnail);
        return $template;
    }

    protected function beforeRender()
    {



        parent::beforeRender();
        @$this->template->slug;
        @$this->template->parentSlug;
        $this->template->setTranslator(new \Grido\Translations\FileTranslator());

        if (!$this->lang) {
            $this->lang = $this->context->parameters['default-lang'];
        }
        $this->prepareNavigation();

    }

    protected function prepareNavigation()
    {
        $this->template->topNavigationData = $this->context->staticPageFacade->getLangTable()->select('staticPage.*, staticPage_lang.*')->where(array('staticPage.is_active'=>1, 'is_in_menu'=> 1, 'lang'=>$this->lang));
    }

}
