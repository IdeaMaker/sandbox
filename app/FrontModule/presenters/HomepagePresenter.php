<?php

/**
 * Homepage presenter.
 */
class HomepagePresenter extends BasePresenter
{

    public function createComponentVideoslider()
    {
        return new VideogalleryControl($this->context->videogalleryFacade);
    }

	public function renderDefault()
	{
		$this->template->page = $this->staticPageFacade->getLangTable()->where(array('slug'=>'hp-'.$this->lang))->fetch();
	}

    /**
     * @var \IdeaMaker\Facades\StaticPageFacade
     */
    protected $staticPageFacade;

    /**
     * @param \IdeaMaker\Facades\StaticPageFacade $staticPageFacade
     * @inject
     */
    public function injectStaticPageFacade(\IdeaMaker\Facades\StaticPageFacade $staticPageFacade)
    {
        $this->staticPageFacade = $staticPageFacade;
    }


    /**
     * @return \IdeaMaker\Facades\StaticPageFacade
     */
    public function getStaticPageFacade() {
        return $this->staticPageFacade;
    }

    public $page;
    public function renderStatic($slug, $parentSlug = null)
    {

        $infoSlugs = array(
            'cs' => 'informace',
            'en' => 'information',
            'de' => 'information'
        );
        if ($parentSlug == 'info') {
            $parentSlug = $infoSlugs[$this->lang];
        }

        if ($parentSlug == 'info') {
            $parentSlug = $infoSlugs[$this->lang];
        }
        if ($parentSlug && !$slug) {
            $slug = $parentSlug;
            $parentSlug = null;
        }
        if ($slug == 'registrace' OR $slug == 'registration' ) {
            $this->setView('registration');
            return $this->renderRegistration();
        }
        $this->template->slug = $slug;
        $this->template->parentSlug = $parentSlug;


        $page = $this->page = $this->staticPageFacade->getLangTable()->getReferencedTable('staticPage', 'id')->select('staticPage_lang:*, staticPage.*')->where(array('staticPage_lang:lang'=>$this->lang, 'slug'=>$slug, 'is_active'=>1))->fetch();

        if ($parentSlug) {
            $parentPage = $this->staticPageFacade->getLangTable()->where(array('lang'=>$this->lang, 'slug'=>$parentSlug))->fetch();
        }

        $this->template->page = $page;
        if ($this->staticPageFacade->hasChildren($parentId = ($parentSlug && $parentPage->id) ? $parentPage->id : $page->id) or $slug == 'fotogalerie') {
            $this->template->parentSlug = $parentSlug ? :$page->slug;
            $this->template->sidebarData = $this->staticPageFacade->findAll()->select('title, slug')->where(array('staticPage_lang:lang'=>$this->lang, 'static_page.is_active'=>1))->where(array('staticPage.parent_id' => $parentId))->order('order');

            $this->setView('static');
        } else {
            $this->setView('static');
        }
    }

    public function createComponentContactForm()
    {
        $form = new \IdeaMaker\Frontend\Forms\ContactForm($this, 'contactForm');
        return $form;
    }

    public function renderVideo($id) {

        if (!$this->template->video =$this->context->videogalleryFacade->findBy(array('id'=> (int)$id, 'is_active'=> 1))->fetch()) {
            throw new \Nette\Application\BadRequestException();
        }

        $this->template->id = $id;

        $this->template->page =\Nette\ArrayHash::from(
            array(
                'title' => 'Video',
                'description' => 'video',
                'keywords' => 'video',
            )
        );

    }

    public function renderRegistration()
    {
        $this->template->page =\Nette\ArrayHash::from(
            array(
                'title' => 'Přihláška filmu / Film Submission Form',
                'description' => 'Přihláška filmu / Film Submission Form',
                'keywords' => 'Přihláška filmu / Film Submission Form',
            )
        );


    }

    public function createComponentRegistrationForm()
    {
        $form = new \IdeaMaker\Frontend\Forms\RegistrationForm();
        return $form;
    }

}
